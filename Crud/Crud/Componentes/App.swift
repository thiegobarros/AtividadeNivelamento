//
//  App.swift
//  Crud
//
//  Created by Barros, Thiego Italo Santos on 24/05/26.
//

import SwiftUI

@main
struct CrudApp: App {
    var body: some Scene {
        WindowGroup {
            ContactListView()
        }
    }
}
#Preview {
    ContactListView()
}
