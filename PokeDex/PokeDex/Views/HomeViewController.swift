//
//  ViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var pokemonViewModel = HomeViewModel(pokemonRepository: PokemonRepository(apiHandler: APIHandler()))

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell
//    }
//    
//
//}
