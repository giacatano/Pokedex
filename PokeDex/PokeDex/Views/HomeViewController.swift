//
//  ViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var pokemonTableView: UITableView!
    
    private lazy var homeViewModel = HomeViewModel(pokemonRepository: PokemonRepository(apiHandler: APIHandler()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        homeViewModel.fetchPokemon()
    }
    
    func setUpTableView(){
        pokemonTableView.register(HomeTableViewCell.setPokemonNib(), forCellReuseIdentifier: "pokemonNib")
        pokemonTableView.dataSource = self
        pokemonTableView.delegate = self
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemonNib = pokemonTableView.dequeueReusableCell(withIdentifier: "pokemonNib", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        return pokemonNib
    }
}
