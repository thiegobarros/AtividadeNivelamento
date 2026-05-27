//
//  ContactFormView.swift
//  Crud
//
//  Created by Barros, Thiego Italo Santos on 24/05/26.
//

import SwiftUI

struct ContactFormView: View {
    @ObservedObject var viewModel: ContactViewModel
    @Environment(\.dismiss) var dismiss
    
    var contactToEdit: Contact?
    
    @State private var name = ""
    @State private var email = ""
    @State private var telephone = ""
    @State private var birthDate = Date()
    @State private var cep = ""
    @State private var neighborhood = ""
    @State private var street = ""
    @State private var number = ""
    @State private var state = ""
    @State private var city = ""
    @State private var isLoadingCEP = false
    
    var body: some View {
        Form {
            Section(header: Text("Informações Pessoais")) {
                TextField("Nome", text: $name)
                TextField("E-mail", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                TextField("Telefone", text: $telephone)
                    .keyboardType(.phonePad)
                DatePicker("Nascimento", selection: $birthDate, displayedComponents: .date)
            }
            
            Section(header: Text("Endereço")) {
                HStack {
                    TextField("CEP (Apenas números)", text: $cep)
                        .keyboardType(.numberPad)
                        .onChange(of: cep) { oldValue, newValue in
                            checkAndFetchCEP(newValue)
                        }
                    
                    if isLoadingCEP {
                        ProgressView()
                    }
                }
                
                TextField("Logradouro (Rua/Av.)", text: $street)
                TextField("Número", text: $number)
                    .keyboardType(.numberPad)
                TextField("Bairro", text: $neighborhood)
                TextField("Cidade", text: $city)
                TextField("Estado (UF)", text: $state)
            }
            
            Button(action: saveContact) {
                Text(contactToEdit == nil ? "Cadastrar Contato" : "Salvar Alterações")
                    .frame(maxWidth: .infinity)
                    .bold()
            }
            .buttonStyle(.borderedProminent)
            .listRowBackground(Color.clear)
        }
        .navigationTitle(contactToEdit == nil ? "Novo Contato" : "Editar Contato")
        .onAppear(perform: setupInitialData)
    }
    
    // Carrega dados se for alteração
    private func setupInitialData() {
        if let contact = contactToEdit {
            name = contact.name
            email = contact.email
            telephone = contact.telephone
            birthDate = contact.birthDate
            cep = contact.cep
            neighborhood = contact.neighborhood
            street = contact.street
            number = contact.number
            state = contact.state
            city = contact.city
        }
    }

    private func checkAndFetchCEP(_ value: String) {
        let clean = value.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()

        if clean.count == 8 {
            isLoadingCEP = true
            
            Task {
                if let res = await viewModel.fetchAddress(from: clean) {
                    await MainActor.run {
                        self.street = res.logradouro ?? ""
                        self.neighborhood = res.bairro ?? ""
                        self.city = res.localidade ?? ""
                        self.state = res.uf ?? ""
                        self.isLoadingCEP = false
                    }
                } else {
                    await MainActor.run {
                        self.isLoadingCEP = false
                    }
                }
            }
        }
    }

    private func saveContact() {
        guard !name.isEmpty else { return }
        
        if let originalContact = contactToEdit {
            let updatedContact = Contact(
                id: originalContact.id,
                name: name,
                email: email,
                telephone: telephone,
                birthDate: birthDate,
                cep: cep,
                neighborhood: neighborhood,
                street: street,
                number: number,
                state: state,
                city: city
            )

            viewModel.updateContact(updatedContact)
            
        } else {
            let newContact = Contact(
                name: name,
                email: email,
                telephone: telephone,
                birthDate: birthDate,
                cep: cep,
                neighborhood: neighborhood,
                street: street,
                number: number,
                state: state,
                city: city
            )
            
            viewModel.addContact(newContact)
        }

        dismiss()
    }

}
