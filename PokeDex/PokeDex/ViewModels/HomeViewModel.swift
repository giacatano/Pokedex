//
//  HomeViewModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

protocol HomeViewModelProtocol {
    func reloadView()
    func showError(error: NetworkError)
}

class HomeViewModel {
    let pokemonRepository: PokemonRepositoryType?
    private var pokemons: [PokemonResponse]
    
    init(pokemonRepository: PokemonRepositoryType?) {
        self.pokemonRepository = pokemonRepository
        self.pokemons = []
    }
    
    func fetchPokemon(){
        pokemonRepository?.fetchPokemon { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pokemon):
                self?.pokemons  = pokemon
                print(pokemon)
            }
        }
    }
}
