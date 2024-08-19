//
//  HomeViewModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func reloadView()
    func showError()
}

class HomeViewModel {
    
    //MARK: Variables
    
    let pokemonRepository: PokemonRepositoryType?
    private var pokemons: [Pokemon]
    private weak var delegate: HomeViewModelProtocol?
    
    init(pokemonRepository: PokemonRepositoryType?, delegate: HomeViewModelProtocol) {
        self.pokemonRepository = pokemonRepository
        self.pokemons = []
        self.delegate = delegate
    }
    
    //MARK: Computed Properties
    
    var numberOfRows: Int {
        pokemons.count
    }
    
    //MARK: Functions
    
    func fetchPokemon() {
        pokemonRepository?.fetchPokemon { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(_):
                    self?.delegate?.showError()
                case .success(let pokemon):
                    self?.pokemons  = pokemon.results
                    self?.delegate?.reloadView()
                    self?.fetchPokemonFromCoreData()
                }
            }
        }
    }
    
    func pokemonCharacter(index: Int) -> Pokemon? {
        guard index >= 0 && index < self.pokemons.count else {
            return nil
        }
        return self.pokemons[index]
    }
    
    private func fetchPokemonFromCoreData() {
        for pokemon in pokemons {
            pokemonRepository?.addPokemonToCoreData(name: pokemon.name)
        }
    }
}
