//
//  PokemonRepository.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

typealias PokemonResult = (Result<PokemonResponse, NetworkError>) -> Void
typealias PokemonStatsResult = (Result<PokemonInfoResponse, NetworkError>) -> Void

protocol PokemonRepositoryType {
    func fetchPokemon(completion: @escaping PokemonResult)
    func fetchPokemonStats(url: String, completion: @escaping PokemonStatsResult)
}

class PokemonRepository: PokemonRepositoryType {
    let apiHandler: APIHandlerType
    
    init(apiHandler: APIHandlerType) {
        self.apiHandler = apiHandler
    }
    
    func fetchPokemon(completion: @escaping PokemonResult) {
        apiHandler.request(endpoint: Endpoints.pokemon, header: .GET, model: PokemonResponse.self, completion: completion)
    }
    
    func fetchPokemonStats(url: String, completion: @escaping PokemonStatsResult) {
        //
    }
}
