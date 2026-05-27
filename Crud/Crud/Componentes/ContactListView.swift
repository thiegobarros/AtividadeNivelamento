//
//  ContactListView.swift
//  Crud
//
//  Created by Barros, Thiego Italo Santos on 24/05/26.
//

import SwiftUI

struct ContactListView: View {
    @StateObject private var viewModel = ContactViewModel()
    @State private var searchText = ""

    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return viewModel.contacts
        } else {
            return viewModel.contacts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                if filteredContacts.isEmpty {
                    Text("Nenhum contato encontrado")
                        .foregroundColor(.secondary)
                } else {
                    ForEach(filteredContacts) { contact in
                        NavigationLink(destination: ContactFormView(viewModel: viewModel, contactToEdit: contact)) {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(contact.name)
                                    .font(.headline)
                                Text(contact.telephone)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("\(contact.street), \(contact.number) - \(contact.city)/\(contact.state)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteContact)
                }
            }
            .navigationTitle("Contatos")
            .searchable(text: $searchText, prompt: "Buscar por nome")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ContactFormView(viewModel: viewModel)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}
