//
//  InfoViewModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/25.
//

import Foundation

class InfoViewModel {
    let pokemonRepository: PokemonRepositoryType?
    private var stats: [Statistics]
    private weak var delegate: HomeViewModelProtocol?
    private var pokemonStatsEndpoint: String?
    
    init(pokemonRepository: PokemonRepositoryType?, delegate: HomeViewModelProtocol) {
        self.pokemonRepository = pokemonRepository
        self.stats = []
        self.delegate = delegate
    }
    
        func fetchPokemonStats(){
            pokemonRepository?.fetchPokemonStats(url: pokemonStatsEndpoint ?? "") { [weak self] result in
                switch result {
                case .failure(let error):
                    print(error)
                    self?.delegate?.showError(error: error)
                case .success(let pokemonStats):
                    self?.stats = pokemonStats.stats
    
                    self?.delegate?.reloadView()
                    print(pokemonStats)
                }
            }
        }
}
