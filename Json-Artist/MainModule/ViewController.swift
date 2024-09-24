//
//  ViewController.swift
//  Json-Artist
//
//  Created by apple on 9/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let artistView = ArtistView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(artistView)
        setConstraints()
        getArtistInfo()
    }
    
    func getArtistInfo() {
        NetworkDataFetch.shared.fetchData { [weak self ] result, error in
            guard let self else { return }
            if let model = result {
                print(model)
                self.artistView.updateLabel(model: model)
                NetworkImageRequest.shared.requestData(completion: model.artists[1].image ) {  result in
                    switch result {
                    case .success(let data):
                        self.artistView.updateLabel(model: data)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
            if let error {
                artistView.artistImageView(data: "Sun")
            }
        }
    }
}

extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            artistView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            artistView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            artistView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            artistView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}

