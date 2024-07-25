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
        saveContext()
        print("saved into core data: \(name)")
    }
    
    func fetchNames() -> [PokemonCoreData] {
        
        do {
            let fetchedPokemons = try context.fetch(PokemonCoreData.fetchRequest())
            print("loaded from coredata: \(fetchedPokemons)")
            return fetchedPokemons
        } catch {
            return []
        }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
