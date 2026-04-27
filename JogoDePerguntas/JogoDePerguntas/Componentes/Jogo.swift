//
//  Jogo.swift
//  JogoDePerguntas
//
//  Created by Barros, Thiego Italo Santos on 26/04/26.
//

import SwiftUI

struct Resposta: Identifiable {
    let id: UUID = UUID()
    var texto: String
    var isCorrect: Bool
}

struct Pergunta: Identifiable {
    let id: UUID = UUID()
    var enunciado: String = ""
    var respostas: [Resposta] = []
}

struct Tema: Identifiable {
    let id: UUID = UUID()
    let nome: String
    var perguntas: [Pergunta] = []
    
    mutating func misturarPerguntas() {
        perguntas = perguntas.shuffled();
    }
}

struct JogoDePerguntas {
    var temas: [Tema] = [
            // TEMA 1
            Tema(nome: "Tecnologia", perguntas: [
                Pergunta(enunciado: "Qual linguagem é usada nativamente para apps iOS?", respostas: [
                    Resposta(texto: "Swift", isCorrect: true),
                    Resposta(texto: "Java", isCorrect: false),
                    Resposta(texto: "Python", isCorrect: false),
                    Resposta(texto: "C#", isCorrect: false)
                ]),
                Pergunta(enunciado: "O que significa a sigla WWW?", respostas: [
                    Resposta(texto: "World Wide Web", isCorrect: true),
                    Resposta(texto: "Web World Wide", isCorrect: false),
                    Resposta(texto: "Wide World Web", isCorrect: false),
                    Resposta(texto: "World Web Wide", isCorrect: false)
                ]),
                Pergunta(enunciado: "Quem fundou a Apple?", respostas: [
                    Resposta(texto: "Steve Jobs", isCorrect: true),
                    Resposta(texto: "Bill Gates", isCorrect: false),
                    Resposta(texto: "Mark Zuckerberg", isCorrect: false),
                    Resposta(texto: "Elon Musk", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual o principal componente de um computador?", respostas: [
                    Resposta(texto: "Processador (CPU)", isCorrect: true),
                    Resposta(texto: "Teclado", isCorrect: false),
                    Resposta(texto: "Mouse", isCorrect: false),
                    Resposta(texto: "Monitor", isCorrect: false)
                ]),
                Pergunta(enunciado: "O que é o Xcode?", respostas: [
                    Resposta(texto: "Um ambiente de desenvolvimento (IDE)", isCorrect: true),
                    Resposta(texto: "Um modelo de iPhone", isCorrect: false),
                    Resposta(texto: "Um console de videogame", isCorrect: false),
                    Resposta(texto: "Uma rede social", isCorrect: false)
                ])
            ]),
            
            // TEMA 2
            Tema(nome: "Geografia", perguntas: [
                Pergunta(enunciado: "Qual o maior país do mundo em território?", respostas: [
                    Resposta(texto: "Rússia", isCorrect: true),
                    Resposta(texto: "Canadá", isCorrect: false),
                    Resposta(texto: "China", isCorrect: false),
                    Resposta(texto: "Brasil", isCorrect: false)
                ]),
                Pergunta(enunciado: "Em qual continente fica o Deserto do Saara?", respostas: [
                    Resposta(texto: "África", isCorrect: true),
                    Resposta(texto: "Ásia", isCorrect: false),
                    Resposta(texto: "Oceania", isCorrect: false),
                    Resposta(texto: "América", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual a capital da França?", respostas: [
                    Resposta(texto: "Paris", isCorrect: true),
                    Resposta(texto: "Londres", isCorrect: false),
                    Resposta(texto: "Roma", isCorrect: false),
                    Resposta(texto: "Berlim", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual o maior oceano do planeta?", respostas: [
                    Resposta(texto: "Oceano Pacífico", isCorrect: true),
                    Resposta(texto: "Oceano Atlântico", isCorrect: false),
                    Resposta(texto: "Oceano Índico", isCorrect: false),
                    Resposta(texto: "Oceano Ártico", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual país tem o formato de uma bota?", respostas: [
                    Resposta(texto: "Itália", isCorrect: true),
                    Resposta(texto: "Portugal", isCorrect: false),
                    Resposta(texto: "México", isCorrect: false),
                    Resposta(texto: "Grécia", isCorrect: false)
                ])
            ]),
            
            // TEMA 3
            Tema(nome: "Ciências", perguntas: [
                Pergunta(enunciado: "Qual o planeta mais próximo do Sol?", respostas: [
                    Resposta(texto: "Mercúrio", isCorrect: true),
                    Resposta(texto: "Vênus", isCorrect: false),
                    Resposta(texto: "Marte", isCorrect: false),
                    Resposta(texto: "Terra", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual o símbolo químico da água?", respostas: [
                    Resposta(texto: "H2O", isCorrect: true),
                    Resposta(texto: "O2", isCorrect: false),
                    Resposta(texto: "CO2", isCorrect: false),
                    Resposta(texto: "NaCl", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual gás os humanos precisam para respirar?", respostas: [
                    Resposta(texto: "Oxigênio", isCorrect: true),
                    Resposta(texto: "Nitrogênio", isCorrect: false),
                    Resposta(texto: "Hélio", isCorrect: false),
                    Resposta(texto: "Gás Carbônico", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual a maior estrela do nosso sistema?", respostas: [
                    Resposta(texto: "Sol", isCorrect: true),
                    Resposta(texto: "Lua", isCorrect: false),
                    Resposta(texto: "Júpiter", isCorrect: false),
                    Resposta(texto: "Sirius", isCorrect: false)
                ]),
                Pergunta(enunciado: "Quantos ossos tem o corpo humano adulto?", respostas: [
                    Resposta(texto: "206", isCorrect: true),
                    Resposta(texto: "150", isCorrect: false),
                    Resposta(texto: "300", isCorrect: false),
                    Resposta(texto: "105", isCorrect: false)
                ])
            ]),
            
            // TEMA 4
            Tema(nome: "Cinema", perguntas: [
                Pergunta(enunciado: "Quem é o diretor de 'O Poderoso Chefão'?", respostas: [
                    Resposta(texto: "Francis Ford Coppola", isCorrect: true),
                    Resposta(texto: "Steven Spielberg", isCorrect: false),
                    Resposta(texto: "James Cameron", isCorrect: false),
                    Resposta(texto: "Christopher Nolan", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual filme ganhou o primeiro Oscar de animação?", respostas: [
                    Resposta(texto: "Shrek", isCorrect: true),
                    Resposta(texto: "Toy Story", isCorrect: false),
                    Resposta(texto: "Rei Leão", isCorrect: false),
                    Resposta(texto: "Procurando Nemo", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual o nome do robô dourado de Star Wars?", respostas: [
                    Resposta(texto: "C-3PO", isCorrect: true),
                    Resposta(texto: "R2-D2", isCorrect: false),
                    Resposta(texto: "BB-8", isCorrect: false),
                    Resposta(texto: "Wall-E", isCorrect: false)
                ]),
                Pergunta(enunciado: "Quem interpreta o Homem de Ferro?", respostas: [
                    Resposta(texto: "Robert Downey Jr.", isCorrect: true),
                    Resposta(texto: "Chris Evans", isCorrect: false),
                    Resposta(texto: "Tom Holland", isCorrect: false),
                    Resposta(texto: "Chris Hemsworth", isCorrect: false)
                ]),
                Pergunta(enunciado: "Qual filme tem a frase 'Eu vejo gente morta'?", respostas: [
                    Resposta(texto: "O Sexto Sentido", isCorrect: true),
                    Resposta(texto: "Os Outros", isCorrect: false),
                    Resposta(texto: "Invocação do Mal", isCorrect: false),
                    Resposta(texto: "Pânico", isCorrect: false)
                ])
            ])
        ]
}

struct Jogo: View {
    
    @State var jogoDePerguntas: JogoDePerguntas = JogoDePerguntas()
        @State var indiceTemaSelecionado: Int? = nil
        @State var perguntaVisivel: Int = 0
        @State var pontos: Int = 0
        @State var mostrarAlerta: Bool = false
        @State var tituloAlerta: String = ""
        @State var mensagemAlerta: String = ""
        
        var body: some View {
            VStack(spacing: 20) {
                
                if let indice = indiceTemaSelecionado {
                    
                    let temaAtual = jogoDePerguntas.temas[indice]
                    
                    if perguntaVisivel < temaAtual.perguntas.count {
                        let pergunta = temaAtual.perguntas[perguntaVisivel]
                        
                        Text(pergunta.enunciado)
                            .font(.title2).multilineTextAlignment(.center).padding()
                        
                        ForEach(pergunta.respostas) { resposta in
                            Button(action: { verificarResposta(resposta, na: pergunta) }) {
                                Text(resposta.texto)
                                    .padding().frame(maxWidth: .infinity)
                                    .background(Color.blue).foregroundColor(.white).cornerRadius(10)
                            }.padding(.horizontal)
                        }
                    } else {
                        Text("Fim de Jogo!").font(.largeTitle)
                        Text("Pontuação: \(pontos)").font(.title2)
                        Button("Voltar ao Menu") { reiniciarJogo() }
                            .padding().background(Color.green).foregroundColor(.white).cornerRadius(10)
                    }
                    
                } else {
                    Text("Escolha um Tema").font(.largeTitle)
                    ForEach(0..<jogoDePerguntas.temas.count, id: \.self) { i in
                        Button(action: {
                            self.indiceTemaSelecionado = i
                            jogoDePerguntas.temas[i].misturarPerguntas()
                        }) {
                            Text(jogoDePerguntas.temas[i].nome)
                                .padding().frame(maxWidth: .infinity)
                                .background(Color.orange).foregroundColor(.white).cornerRadius(10)
                        }.padding(.horizontal)
                    }
                }
            }
            .alert(tituloAlerta, isPresented: $mostrarAlerta) {
                Button("Ok") { perguntaVisivel += 1 }
            } message: {
                Text(mensagemAlerta)
            }
        }
        
        func verificarResposta(_ resposta: Resposta, na pergunta: Pergunta) {
            if resposta.isCorrect {
                pontos += 2
                tituloAlerta = "Parabéns, você acertou!"
                mensagemAlerta = "Você ganhou 2 pontos."
            } else {
                let correta = pergunta.respostas.first(where: { $0.isCorrect })?.texto ?? ""
                tituloAlerta = "Que pena, você errou."
                mensagemAlerta = "A resposta correta era: \(correta)"
            }
            mostrarAlerta = true
        }
        
        func reiniciarJogo() {
            perguntaVisivel = 0
            pontos = 0
            indiceTemaSelecionado = nil
        }
}
