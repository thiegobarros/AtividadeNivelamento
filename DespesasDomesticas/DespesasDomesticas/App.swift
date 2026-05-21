//
//  App.swift
//  DespesasDomesticas
//
//  Created by Barros, Thiego Italo Santos on 21/05/26.
//

import SwiftUI
internal import CoreData

@main
struct FinancasDomesticasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ExpenseDashboardView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

#Preview {
    FinancasDomesticasApp()
}
