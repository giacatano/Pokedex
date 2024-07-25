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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }
    
    private func setUpTableView() {
        pokemonStatsTableView.register(InfoTableViewCell.setPokemonStatsNib(), forCellReuseIdentifier: "InfoTableViewCell")
        pokemonStatsTableView.dataSource = self
        pokemonStatsTableView.delegate = self
    }
    
    func reloadView() {
        pokemonStatsTableView.reloadData()
    }
    
    func showError(error: NetworkError) {
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
        guard let pokemonStatsNib = pokemonStatsTableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        return pokemonStatsNib
    }
}
