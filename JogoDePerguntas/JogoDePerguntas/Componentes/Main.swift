//
//  Main.swift
//  JogoDePerguntas
//
//  Created by Barros, Thiego Italo Santos on 26/04/26.
//

import SwiftUI

struct Main: View {
    var body: some View {
        Text("Jogo de Perguntas")
            .font(.largeTitle).bold()
        
        Spacer()
        
        Jogo()
        
        Spacer()
    }
}

#Preview {
    Main()
}
