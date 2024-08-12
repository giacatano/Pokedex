//
//  HomeViewModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func reloadView()
    func showError(error: String)
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
    
    //MARK: Computed Properties
    
    var numberOfRows: Int {
        pokemons.count
    }
    
    //MARK: Functions
    
    func fetchPokemon() {
        pokemonRepository?.fetchPokemon { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.delegate?.showError(error: error.localizedDescription)
                case .success(let pokemon):
                    self?.pokemons  = pokemon.results
                    self?.delegate?.reloadView()
                    self?.savePokemonToCoreData()
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
    
    func savePokemonToCoreData() {
        for pokemon in pokemons {
            coreData.saveObjectIntoCoreData(name: pokemon.name)
        }
    }
}
