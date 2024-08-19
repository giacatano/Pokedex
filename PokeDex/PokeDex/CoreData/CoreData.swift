//
//  CoreData.swift
//  PokeDex
//
//  Created by Gia Catano on 2024/07/25.
//

import Foundation
import CoreData
import UIKit

// MARK: - Core Data Handler Protocol

protocol CoreDataHandlerType {
    func savePokemonIntoCoreData(name: String)
}

// MARK: - Core Data Class

class CoreDataHandler: CoreDataHandlerType {
    
    // MARK: - Variables
    
    weak var appDelegate: AppDelegate?
    let context: NSManagedObjectContext
    
    init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to access AppDelegate")
        }
        self.appDelegate = appDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Core Data CRUD Functions
    
    func savePokemonIntoCoreData(name: String) {
        let newPokemon = PokemonCoreData(context: context)
        newPokemon.name = name
        saveContext()
        print("saved name into core data: \(name)")
    }
    
    private func fetchNames() -> [PokemonCoreData] {
        do {
            let fetchedPokemons = try context.fetch(PokemonCoreData.fetchRequest())
            print("loaded pokemons from coredata: \(fetchedPokemons)")
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
