//
//  HomeTableViewCell.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var pokemonCharacterImageView: UIImageView!
    @IBOutlet private weak var pokemonCharacterNameLabel: UILabel!
    
    //MARK: Functions
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func setPokemonNib() -> UINib {
        UINib(nibName: Constants.Identifiers.homeTableViewCell , bundle: nil)
    }
    
    func setupPokemonUI(index: String, name: String) {
        pokemonCharacterImageView.load(urlString: Endpoints.images + index + ".png")
        pokemonCharacterNameLabel.text = name
    }
}
