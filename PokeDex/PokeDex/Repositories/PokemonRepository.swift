//
//  PokemonRepository.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

typealias PokemonResult = Result<[PokemonResponse], NetworkError>

protocol PokemonRepositoryType {
    func fetchPokemon(completion: @escaping (PokemonResult) -> Void)
}

class PokemonRepository: PokemonRepositoryType {
    func fetchPokemon(completion: @escaping (PokemonResult) -> Void) {
        //get pokemon
    }
}
