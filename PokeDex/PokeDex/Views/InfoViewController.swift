//
//  InfoViewController.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet private weak var pokemonCharacterImageView: UIImageView!
    @IBOutlet private weak var hpLabel: UILabel!
    @IBOutlet private weak var hpStatLabel: UILabel!
    @IBOutlet private weak var attackLabel: UILabel!
    @IBOutlet private weak var attackStatLabel: UILabel!
    @IBOutlet private weak var defenseLabel: UILabel!
    @IBOutlet private weak var defenseStatLabel: UILabel!
    @IBOutlet private weak var specialAttackLabel: UILabel!
    @IBOutlet private weak var specialAttackStatLabel: UILabel!
    @IBOutlet private weak var specialDefenseLabel: UILabel!
    @IBOutlet private weak var specialDefenseStatLabel: UILabel!
    @IBOutlet private weak var speedLabel: UILabel!
    @IBOutlet private weak var speedStatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
