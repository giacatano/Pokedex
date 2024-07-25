//
//  CoreData.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/25.
//

import Foundation
import CoreData
import UIKit

protocol CoreDataHandlerType {
    
}

class CoreDataHandler: CoreDataHandlerType {
    weak var appDelegate: AppDelegate?
    let context: NSManagedObjectContext
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access AppDelegate")
        }
        self.appDelegate = appDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    func saveObjectIntoCoreData(name: String) {
        let newPokemon = PokemonCoreData(context: context)
        newPokemon.name = name
        print("saved into core data: \(name)")
    }
}
