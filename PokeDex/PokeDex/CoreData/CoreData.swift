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
    
    func addPokemonCoreData(name: String) {
        let newPokemon = PokemonCoreData(context: context)
        newPokemon.name = name
        saveContext()
        print("saved name into core data: \(name)")
    }
    
    func addStatisticsCoreData(baseStat: Int64) {
        let newStatistic = StatisticsCoreData(context: context)
        newStatistic.baseStat = baseStat
        saveContext()
        print("saved stat into core data: \(baseStat)")
    }
    
    func fetchNames() -> [PokemonCoreData] {
        
        do {
            let fetchedPokemons = try context.fetch(PokemonCoreData.fetchRequest())
            print("loaded pokemons from coredata: \(fetchedPokemons)")
            return fetchedPokemons
        } catch {
            return []
        }
    }
    
    func fetchStats() -> [StatisticsCoreData] {
        do {
            let fetchedStats = try context.fetch(StatisticsCoreData.fetchRequest())
            print("loaded stats from coredata: \(fetchedStats)")
            return fetchedStats
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
