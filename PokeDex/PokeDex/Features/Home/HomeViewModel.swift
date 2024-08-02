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
    
    //MARK: Variables
    
    let pokemonRepository: PokemonRepositoryType?
    private var pokemons: [Pokemon]
    private weak var delegate: HomeViewModelProtocol?
    let coreData = CoreDataHandler()
    
    init(pokemonRepository: PokemonRepositoryType?, delegate: HomeViewModelProtocol) {
        self.pokemonRepository = pokemonRepository
        self.pokemons = []
        self.delegate = delegate
    }
    
    //MARK: Functions
    
    func fetchPokemon() {
        pokemonRepository?.fetchPokemon { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pokemon):
                self?.pokemons  = pokemon.results
                self?.delegate?.reloadView()
                self?.savePokemonToCoreData()
            }
        }
    }
    
    func pokemonCharacter(index: Int) -> Pokemon? {
        guard index >= 0 && index < self.pokemons.count else {
            return nil
        }
        return self.pokemons[index]
    }
    
    func savePokemonToCoreData() {
        for pokemon in pokemons {
            coreData.saveObjectIntoCoreData(name: pokemon.name)
        }
    }
}
