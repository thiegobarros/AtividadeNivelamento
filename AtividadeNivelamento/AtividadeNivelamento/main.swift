//
//  main.swift
//  AtividadeNivelamento
//
//  Created by Barros, Thiego Italo Santos on 12/04/26.
//

protocol Pessoa {
    var id: Int { get }
    var nome: String { get set }
    var idade: String { get set }
}

struct Contato: Pessoa {
    var id: Int
    var nome: String
    var idade: String
    var telefone: String
    var eMail: String
}

struct Sistema {
    var contatos: [Contato] = []
    var comando: String = ""
    
    init() {
        while comando != "5" {
            print("O que você deseja fazer? (Use um comando de 1 a 5)")
            print("1 - Cadastrar Contato")
            print("2 - Listar Contatos")
            print("3 - Alterar Contato")
            print("4 - Remover Contato")
            print("5 - Finalizar Sistema")
            
            comando = readLine()!
            
            switch comando {
            case "1":
                cadastrarContato()
            case "2":
                listarContatos()
            case "3":
                listarContatos()
                alterarContato()
            case "4":
                listarContatos()
                removerContato()
            case "5":
                print("Sistema finalizado!")
            default:
                print("Comando inválido!")
            }
        }

    }
    
    func listarContatos() -> Void {
        print("Listagem de Contatos:")
        for contato in contatos {
            print("ID: \(contato.id) | NOME: \(contato.nome) | IDADE: \(contato.idade) | TELEFONE: \(contato.telefone) |  E-MAIL: \(contato.eMail)")
        }
    }
    
    mutating func cadastrarContato() -> Void {
        let index: Int = contatos.count + 1
        
        print("Insire um nome:")
        let nome: String = readLine()!
        
        if existeNome(nome) {
            print("O contato não pode ser cadastrado, pois o nome já existe!")
            return
        }
        
        print("Insira uma idade:")
        let idade: String = readLine()!
        print("Insira um telefone:")
        let telefone: String = readLine()!
        print("Insira um e-mail:")
        let eMail: String = readLine()!
        
        if (nome == "" || idade == "" || telefone == "" || eMail == "") {
            print("O cadastro não pode ser efetuado com sucesso, pois existem informações vazias!")
            return
        }
        
        let contato: Contato = Contato(
            id: index,
            nome: nome,
            idade: idade,
            telefone: telefone,
            eMail: eMail
        )
        
        contatos.append(contato)
        print("Cadastro de contato realizado com sucesso!")
    }

    mutating func alterarContato() -> Void {
        if contatos.isEmpty {
            print("Não há contatos cadastrados para serem alterados.")
            return
        }
        
        print("Digite o ID do contato que deseja alterar:")
        
        guard let idString: String = readLine(),
              let id: Int = Int(idString),
              let index = contatos.firstIndex(where: { $0.id == id }) else {
            print("ID inválido!")
            return
        }
        
        print("IMPORTANTE! As informações deixadas em branco não serão alteradas.")
        
        print("Insire um novo nome:")
        let nome: String = readLine()!
        
        if existeNome(nome) {
            print("O contato não pode ser alterado, pois o nome já existe!")
            return
        }
        
        print("Insira uma nova idade:")
        let idade: String = readLine()!
        print("Insira um novo telefone:")
        let telefone: String = readLine()!
        print("Insira um novo e-mail:")
        let eMail: String = readLine()!
        
        if nome != "" { contatos[index].nome = nome }
        if idade != "" { contatos[index].idade = idade }
        if telefone != "" { contatos[index].telefone = telefone }
        if eMail != "" { contatos[index].eMail = eMail }
        
        print("Alteração de contato realizada com sucesso!")
    }

    mutating func removerContato() -> Void {
        if contatos.isEmpty {
            print("Não há contatos cadastrados para serem removidos.")
            return
        }
        
        print("Digite o ID do contato que deseja remover:")
        
        guard let idString: String = readLine(),
              let id: Int = Int(idString),
              let index = contatos.firstIndex(where: { $0.id == id }) else {
            print("ID inválido!")
            return
        }
        
        contatos.remove(at: index)
        print("Contato removido com sucesso!")
    }
    
    func existeNome(_ nome: String) -> Bool {
        contatos.contains(where: { $0.nome.lowercased() == nome.lowercased() })
    }
}

let sistema: Sistema = Sistema.init()
