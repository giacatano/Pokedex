//
//  PokemonRepository.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

// MARK: Typealias

typealias PokemonResult = (Result<PokemonResponse, NetworkError>) -> Void

// MARK: Protocol

protocol PokemonRepositoryType {
    func fetchPokemon(completion: @escaping PokemonResult)
    func fetchPokemonFromCoreData(name: String)
}

// MARK: Pokemon Repository

class PokemonRepository: PokemonRepositoryType {
    let apiHandler: APIHandlerType
    let coreDataHandler: CoreDataHandlerType
    
    init(apiHandler: APIHandlerType, coreDataHandler: CoreDataHandlerType) {
        self.apiHandler = apiHandler
        self.coreDataHandler = coreDataHandler
    }
    
    func fetchPokemon(completion: @escaping PokemonResult) {
        apiHandler.request(endpoint: Endpoints.pokemon, header: .GET, model: PokemonResponse.self, completion: completion)
    }
    
    func fetchPokemonFromCoreData(name: String) {
        coreDataHandler.addPokemonCoreData(name: name)
    }
}
