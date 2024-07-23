//
//  ViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var  apiHandler = HomeViewModel(pokemonRepository: PokemonRepository(apiHandler: APIHandler()))

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

