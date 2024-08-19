//
//  InfoViewModel.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/25.
//

import Foundation

class InfoViewModel {
    
    //MARK: Variables
    
    let pokemonInfoRepository: PokemonInfoRepositoryType?
    private var stats: [Statistics]
    private weak var delegate: HomeViewModelProtocol?
    private var pokemonStatsEndpoint: String?
    private var image: String?
    private var name: String?
    
    init(pokemonInfoRepository: PokemonInfoRepositoryType?, delegate: HomeViewModelProtocol) {
        self.pokemonInfoRepository = pokemonInfoRepository
        self.stats = []
        self.delegate = delegate
    }
    
    //MARK: Computed Properties
    
    var numberOfRows: Int {
        stats.count
    }
    
    var rowHeight: CGFloat {
        50
    }
    
    //MARK: Functions
    
    func fetchPokemonStats(){
        pokemonInfoRepository?.fetchPokemonStats(url: pokemonStatsEndpoint ?? "") { [weak self] result in
            switch result {
            case .failure(_):
                self?.delegate?.showError()
            case .success(let pokemonStats):
                self?.stats = pokemonStats.stats
                self?.delegate?.reloadView()
            }
        }
    }
    
    func setPokemonInfo(url: String, image: String, name: String) {
        self.pokemonStatsEndpoint = url
        self.name = name
        self.image = image
    }
    
    func displayName() -> String {
        return self.name ?? ""
    }
    
    func displayImage() -> String {
        return self.image ?? ""
    }
    
    func displayScore(index: Int) -> String {
        guard index >= 0 && index < self.stats.count else {
            return ""
        }
        return String(stats[index].base_stat)
    }
    
    func displayCategory(index: Int) -> String {
        guard index >= 0 && index < self.stats.count else {
            return ""
        }
        return stats[index].stat.name
    }
}
