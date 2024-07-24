//
//  HomeTableViewCell.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet private weak var pokemonCharacterImageView: UIImageView!
    @IBOutlet private weak var pokemonCharacterNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func setPokemonNib() -> UINib {
        UINib(nibName: "HomeTableViewCell" , bundle: nil)
    }
    
    func image(number: String){
        pokemonCharacterImageView.load(urlString: Endpoints.images + number + ".png")
    }
}
