//
//  ViewController.swift
//  Json-Artist
//
//  Created by apple on 9/16/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let artistImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let discriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Discription"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 10
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        view.addSubview(artistImageView)
        view.addSubview(discriptionLabel)
        setConstraints()
        getArtistInfo()

    }
    
    func updateImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        artistImageView.image = image
        print(image)
    }
    
    func updateLabel(model: ArtistModel){
        discriptionLabel.text = model.artists.description

    }
    
//    func updateImageViev(model: ArtistModel) {
//        guard let image = UIImage(data: data) else {
//            return
//        }
//        artistImageView.image = image
//    }
    
    func getArtistInfo() {
        NetworkDataFetch.shared.fetchData { [weak self ] result, error in
            guard let self else { return }
            
            
            if let model = result {
                print(model)

            }
        }
    }
}

extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            artistImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            artistImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            artistImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            artistImageView.heightAnchor.constraint(equalToConstant: 200),
            
            discriptionLabel.topAnchor.constraint(equalTo: artistImageView.bottomAnchor, constant: 20),
            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            discriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            discriptionLabel.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}

