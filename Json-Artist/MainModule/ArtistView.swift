//
//  ArtistView.swift
//  Json-Artist
//
//  Created by apple on 9/23/24.
//

import UIKit

class ArtistView: UIView {
    
    private let artistImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 10
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let artistBioLabel: UILabel = {
        let label = UILabel()
        label.text = "History of artist"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        addShadowOnView()
        
        addSubview(artistBioLabel)
        addSubview(artistImageView)
        addSubview(artistNameLabel)
    }
    
    func artistImageView(data: Data) {
            guard let image = UIImage(data: data) else { return }
        artistImageView.image = image
            print(image)
        }
        
        func updateLabel(model: ArtistModel){
            artistBioLabel.text = model.artists[0].bio
    
        }
}

extension ArtistView {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            artistImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            artistImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                      constant: -10),
            artistImageView.widthAnchor.constraint(equalToConstant: 60),
            artistImageView.heightAnchor.constraint(equalToConstant: 60),
            
            // artistNameLabel
            artistNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            artistNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: 10),
            artistNameLabel.trailingAnchor.constraint(equalTo: artistImageView.leadingAnchor,
                                                      constant: -10),
            artistNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            // artistBioLabel
            artistBioLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor,
                                                constant: 0),
            artistBioLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                    constant: 10),
            artistBioLabel.trailingAnchor.constraint(equalTo: artistImageView.leadingAnchor,
                                                     constant: -10),
            artistBioLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                   constant: -5)
        ])
    }
}

