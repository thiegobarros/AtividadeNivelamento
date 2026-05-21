//
//  ExpensiveViewModel.swift
//  DespesasDomesticas
//
//  Created by Barros, Thiego Italo Santos on 21/05/26.
//

import Foundation
internal import CoreData
internal import Combine

class ExpenseViewModel: ObservableObject {
    var objectWillChange: ObservableObjectPublisher
    
    private let context: NSManagedObjectContext
    
    // Categorias e Meses fixos solicitados
    let categories = ["Energia", "Internet", "Água", "Assinaturas", "Aluguel", "Mercado", "Cursos", "Lazer"]
    let months = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio"]
    
    @Published var selectedMonth: String = "Janeiro"
    @Published var filteredExpenses: [Expense] = []
    
    init(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
        self.context = context
        fetchExpenses()
    }
    
    // Buscar despesas filtradas pelo mês selecionado
    func fetchExpenses() {
        let request = NSFetchRequest<Expense>(entityName: "Expense")
        request.predicate = NSPredicate(format: "month == %@", selectedMonth)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Expense.date, ascending: false)]
        
        do {
            filteredExpenses = try context.fetch(request)
        } catch {
            print("Erro ao buscar despesas: \(error)")
        }
    }
    
    // Adicionar nova despesa
    func addExpense(name: String, amount: Double, month: String) {
        let newExpense = Expense(context: context)
        newExpense.id = UUID()
        newExpense.category = name
        newExpense.amount = amount
        newExpense.month = month
        newExpense.date = Date()
        
        saveContext()
        fetchExpenses() // Atualiza a lista na UI
    }
    
    // Deletar despesa
    func deleteExpense(at offsets: IndexSet) {
        offsets.map { filteredExpenses[$0] }.forEach(context.delete)
        saveContext()
        fetchExpenses()
    }
    
    // Calcular o total acumulado do mês selecionado
    var totalMonthlyExpenses: Double {
        filteredExpenses.reduce(0) { $0 + $1.amount }
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Erro ao salvar dados: \(error)")
            }
        }
    }
}
