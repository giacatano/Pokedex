//
//  PokemonInfoModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/24.
//

import Foundation

struct PokemonInfoResponse: Codable {
    let sprites: Images
    let stats: [Statistics]
}

struct Statistics: Codable {
    let base_stat: Int
    let stat: StatCategory
}

struct StatCategory: Codable {
    let name: String
}

struct Images: Codable {
    let other: OfficialArtworkImages
}

struct OfficialArtworkImages: Codable {
    let officialArtwork: FrontImageOfPokemon
    
    enum CodingKeys: String, CodingKey {
        case officialArtwork = "official-artwork"
    }
}

struct FrontImageOfPokemon: Codable {
    let front_default: String
}
