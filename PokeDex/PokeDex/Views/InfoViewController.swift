//
//  InfoViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class InfoViewController: UIViewController, HomeViewModelProtocol {
    
    @IBOutlet private weak var pokemonCharacterImageView: UIImageView!
    @IBOutlet private weak var pokemonCharacterNameLabel: UILabel!
    @IBOutlet private weak var pokemonStatsTableView: UITableView!
    
    private lazy var infoViewModel = InfoViewModel(pokemonRepository: PokemonRepository(apiHandler: APIHandler()), delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        infoViewModel.fetchPokemonStats()
    }

    func setPokemonCharacter(url: String, image: String, name: String) {
            infoViewModel.setPokemonInfo(url: url, image: image, name: name)
        }
    
    private func setUpTableView() {
        pokemonStatsTableView.register(InfoTableViewCell.setPokemonStatsNib(), forCellReuseIdentifier: "InfoTableViewCell")
        pokemonStatsTableView.dataSource = self
        pokemonStatsTableView.delegate = self
        self.pokemonCharacterNameLabel.text = infoViewModel.displayName()
    }
    
    func reloadView() {
        pokemonStatsTableView.reloadData()
    }
    
    func showError(error: NetworkError) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
            infoViewModel.fetchPokemonStats()
        }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let statsNib = pokemonStatsTableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? InfoTableViewCell else {
            return UITableViewCell()
        }
        statsNib.setupStatsUI(category: infoViewModel.displayCategory(index: indexPath.row), stat: infoViewModel.displayScore(index: indexPath.row))
        return statsNib
    }
}
