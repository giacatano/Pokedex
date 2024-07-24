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
    @IBOutlet private weak var hpBaseStatLabel: UILabel!
    
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var attackStatLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var defenseStatLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
