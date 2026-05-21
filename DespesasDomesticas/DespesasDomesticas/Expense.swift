//
//  Expense.swift
//  DespesasDomesticas
//
//  Created by Barros, Thiego Italo Santos on 21/05/26.
//

import Foundation
internal import CoreData

// Define a classe da Entidade para o Core Data
@objc(Expense)
public class Expense: NSManagedObject, Identifiable {
    
    // Mapeamento dos atributos configurados na interface visual
    @NSManaged public var id: UUID?
    @NSManaged public var category: String?
    @NSManaged public var amount: Double
    @NSManaged public var month: String?
    @NSManaged public var date: Date?
    
    // Propriedades seguras para usar no SwiftUI (evita tratar nulos na View)
    public var wrappedCategory: String { category ?? "Outros" }
    public var wrappedMonth: String { month ?? "Janeiro" }
}
