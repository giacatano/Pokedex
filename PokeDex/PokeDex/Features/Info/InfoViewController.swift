//
//  InfoViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class InfoViewController: UIViewController, HomeViewModelProtocol {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var pokemonStatsTableView: UITableView!
    @IBOutlet weak var pokemonCharacterImageView: UIImageView!
    
    //MARK: Variables
    
    private lazy var infoViewModel = InfoViewModel(pokemonInfoRepository: PokemonInfoRepository(apiHandler: APIHandler()), delegate: self)
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        infoViewModel.fetchPokemonStats()
        setPokemonImage()
    }
    
    func setPokemonCharacter(url: String, image: String, name: String) {
        infoViewModel.setPokemonInfo(url: url, image: image, name: name)
        navigationItem.title = name
    }
    
    func reloadView() {
        pokemonStatsTableView.reloadData()
    }
    
    func showError(error: String) {
        showAlert(title: Strings.Alerts.networkErrorTitle, message: Strings.Alerts.networkErrorTitle)
    }
    
    private func setPokemonImage() {
        pokemonCharacterImageView.load(urlString: Endpoints.images + infoViewModel.displayImage() + ".png")
    }
    
    private func setUpTableView() {
        pokemonStatsTableView.register(InfoTableViewCell.setPokemonStatsNib(), forCellReuseIdentifier: Strings.Identifiers.infoTableViewCell)
        pokemonStatsTableView.dataSource = self
        pokemonStatsTableView.delegate = self
    }
}

//MARK: Extensions

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        infoViewModel.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let statsNib = pokemonStatsTableView.dequeueReusableCell(withIdentifier: Strings.Identifiers.infoTableViewCell, for: indexPath) as? InfoTableViewCell else {
            return UITableViewCell()
        }
        statsNib.setupStatsUI(category: infoViewModel.displayCategory(index: indexPath.row), stat: infoViewModel.displayScore(index: indexPath.row))
        return statsNib
    }
}
