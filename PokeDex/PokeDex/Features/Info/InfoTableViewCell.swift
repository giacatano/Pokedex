//
//  InfoTableViewCell.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/25.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet private weak var statsCategoryLabel: UILabel!
    @IBOutlet private weak var baseStatLabel: UILabel!
    
    //MARK: Functions
    
    static func setPokemonStatsNib() -> UINib {
        UINib(nibName: Constants.Identifiers.infoTableViewCell , bundle: nil)
    }
    
    func setupStatsUI(category: String, stat: String) {
        statsCategoryLabel.text = category
        baseStatLabel.text = stat
    }
}
