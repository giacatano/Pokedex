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
    }
    
    
    func setUpTableView(){
        pokemonTableView.register(HomeTableViewCell.setPokemonNib(), forCellReuseIdentifier: "pokemonNib")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemonCell = HomeTableViewCell() {
            
        }
        return UITableViewCell
    }
}
