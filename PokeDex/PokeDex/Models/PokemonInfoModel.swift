//
//  PokemonInfoModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/24.
//

import Foundation

struct PokemonInfoResponse: Codable {
     let stats: [Statistics]
}

struct Statistics: Codable {
    let base_stat: Int
    let stat: StatCategory
}

struct StatCategory: Codable {
    let name: String
}
