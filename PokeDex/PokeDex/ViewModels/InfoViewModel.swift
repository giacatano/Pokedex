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
    
    init(pokemonRepository: PokemonRepositoryType?, delegate: HomeViewModelProtocol) {
        self.pokemonRepository = pokemonRepository
        self.stats = []
        self.delegate = delegate
    }
}
