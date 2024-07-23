//
//  PokemonModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

struct PokemonResponse: Codable {
    let results: [Results]
}

struct Results: Codable {
    let name: String
    let url: String
}
