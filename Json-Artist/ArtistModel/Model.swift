//
//  Model.swift
//  Json-Artist
//
//  Created by apple on 9/16/24.
//

import Foundation

// MARK: - ArtistModel
struct ArtistModel: Decodable {
    let artists: [Artist]
}

// MARK: - Artist
struct Artist: Decodable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

// MARK: - Work
struct Work: Decodable {
    let title: String
    let image: String
    let info: String
}

