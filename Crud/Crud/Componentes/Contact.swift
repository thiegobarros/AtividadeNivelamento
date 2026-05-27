//
//  Contact.swift
//  Crud
//
//  Created by Barros, Thiego Italo Santos on 24/05/26.
//

import Foundation

struct Contact: Identifiable, Equatable {
    let id: UUID
    
    var name: String
    var email: String
    var telephone: String
    var birthDate: Date
    var cep: String
    var neighborhood: String
    var street: String
    var number: String
    var state: String
    var city: String

    init(id: UUID = UUID(), name: String, email: String, telephone: String, birthDate: Date, cep: String, neighborhood: String, street: String, number: String, state: String, city: String) {
        self.id = id
        self.name = name
        self.email = email
        self.telephone = telephone
        self.birthDate = birthDate
        self.cep = cep
        self.neighborhood = neighborhood
        self.street = street
        self.number = number
        self.state = state
        self.city = city
    }
}
