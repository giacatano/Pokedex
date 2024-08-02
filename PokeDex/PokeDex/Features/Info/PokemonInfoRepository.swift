//
//  PokemonInfoRepository.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/08/02.
//

import Foundation

typealias PokemonStatsResult = (Result<PokemonInfoResponse, NetworkError>) -> Void

protocol PokemonInfoRepositoryType {
    func fetchPokemonStats(url: String, completion: @escaping PokemonStatsResult)
}

class PokemonInfoRepository: PokemonInfoRepositoryType {
    let apiHandler: APIHandlerType
    
    init(apiHandler: APIHandlerType) {
        self.apiHandler = apiHandler
    }
    
    func fetchPokemonStats(url: String, completion: @escaping PokemonStatsResult) {
        apiHandler.request(endpoint: url, header: .GET, model: PokemonInfoResponse.self, completion: completion)
    }
}
