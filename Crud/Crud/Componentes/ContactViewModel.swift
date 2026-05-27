//
//  ContactViewModel.swift
//  Crud
//
//  Created by Barros, Thiego Italo Santos on 24/05/26.
//

import SwiftUI
import Foundation
internal import Combine

struct ViaCEPResponse: Decodable, Sendable {
    let logradouro: String?
    let bairro: String?
    let localidade: String?
    let uf: String?
    let erro: Bool?
}

@MainActor
class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func updateContact(_ updatedContact: Contact) {
        if let index = contacts.firstIndex(where: { $0.id == updatedContact.id }) {
            contacts[index] = updatedContact
        }
    }
    
    func deleteContact(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }

    func fetchAddress(from cep: String) async -> ViaCEPResponse? {
        let cleanCEP = cep.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        guard cleanCEP.count == 8,
              let url = URL(string: "https://viacep.com.br/ws/\(cleanCEP)/json/") else {
            return nil
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                print("❌ Erro: Servidor retornou código diferente de 200")
                return nil
            }
            
            let decodedResponse = try JSONDecoder().decode(ViaCEPResponse.self, from: data)
            print("✅ Endereço recebido com sucesso: \(decodedResponse.logradouro ?? "")")
            
            if decodedResponse.erro == true { return nil }
            return decodedResponse
        } catch {
            print("❌ Falha crítica na requisição: \(error.localizedDescription)")
            return nil
        }
    }
}
