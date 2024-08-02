//
//  ViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class HomeViewController: UIViewController, HomeViewModelProtocol {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var pokemonTableView: UITableView!
    
    //MARK: Variables
    
    private lazy var homeViewModel = HomeViewModel(pokemonRepository: PokemonRepository(apiHandler: APIHandler()), delegate: self)
    
    //MARK: Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        homeViewModel.fetchPokemon()
    }
    
    func reloadView() {
        pokemonTableView.reloadData()
    }
    
    func showError(error: NetworkError) {
    }
    
    private func setUpTableView(){
        pokemonTableView.register(HomeTableViewCell.setPokemonNib(), forCellReuseIdentifier: Constants.Identifiers.pokemonNib)
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
    }
}

//MARK: Extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        homeViewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemonNib = pokemonTableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.pokemonNib, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        if let pokemon = homeViewModel.pokemonCharacter(index: indexPath.row) {
            pokemonNib.setupPokemonUI(index: String(indexPath.row + 1), name: pokemon.name)
        } else {
            pokemonNib.setupPokemonUI(index: "0", name: "Unknown")
        }
        return pokemonNib
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.Identifiers.infoSegue, sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = sender as? IndexPath,
           segue.identifier == Constants.Identifiers.infoSegue {
            if let infoViewController = segue.destination as? InfoViewController {
                infoViewController.setPokemonCharacter(url: homeViewModel.pokemonCharacter(index: indexPath.row)?.url ?? "", image: "", name: homeViewModel.pokemonCharacter(index: indexPath.row)?.name ?? "")
            }
        }
    }
}
