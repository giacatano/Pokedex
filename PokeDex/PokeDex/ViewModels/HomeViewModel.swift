//
//  HomeViewModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func reloadView()
    func showError(error: NetworkError)
}

class HomeViewModel {
    let pokemonRepository: PokemonRepositoryType?
    private var pokemons: [Pokemon]
    private weak var delegate: HomeViewModelProtocol?
    
    init(pokemonRepository: PokemonRepositoryType?, delegate: HomeViewModelProtocol) {
        self.pokemonRepository = pokemonRepository
        self.pokemons = []
        self.delegate = delegate
    }
    
    func fetchPokemon(){
        pokemonRepository?.fetchPokemon { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pokemon):
                self?.pokemons  = pokemon.results
                self?.delegate?.reloadView()
            }
        }
    }
    
    func pokemonCharacter(index: Int) -> Pokemon? {
        guard index >= 0 && index < self.pokemons.count else {
            return nil
        }
        return self.pokemons[index]
    }
}
