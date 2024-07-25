//
//  InfoTableViewCell.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/25.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var statsCategoryLabel: UILabel!
    @IBOutlet private weak var baseStatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func setPokemonStatsNib() -> UINib {
        UINib(nibName: "InfoTableViewCell" , bundle: nil)
    }
}
