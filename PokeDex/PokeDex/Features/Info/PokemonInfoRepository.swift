//
//  PokemonInfoRepository.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/08/02.
//

import Foundation

// MARK: Typealias

typealias PokemonStatsResult = (Result<PokemonInfoResponse, NetworkError>) -> Void

// MARK: Protocol

protocol PokemonInfoRepositoryType {
    func fetchPokemonStats(url: String, completion: @escaping PokemonStatsResult)
}

// MARK: Pokemon Info Repository

class PokemonInfoRepository: PokemonInfoRepositoryType {
    let apiHandler: APIHandlerType
    let coreDataHandler: CoreDataHandlerType
    
    init(apiHandler: APIHandlerType, coreDataHandler: CoreDataHandlerType) {
        self.apiHandler = apiHandler
        self.coreDataHandler = coreDataHandler
    }
    
    func fetchPokemonStats(url: String, completion: @escaping PokemonStatsResult) {
        apiHandler.request(endpoint: url, header: .GET, model: PokemonInfoResponse.self, completion: completion)
    }
}
