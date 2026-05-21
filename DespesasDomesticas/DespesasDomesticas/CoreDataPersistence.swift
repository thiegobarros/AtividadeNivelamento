//
//  CoreDataPersistence.swift
//  DespesasDomesticas
//
//  Created by Barros, Thiego Italo Santos on 21/05/26.
//

internal import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "DespesasModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Erro ao carregar Core Data: \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
