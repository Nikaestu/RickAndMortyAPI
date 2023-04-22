//
//  AboutView.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 18/04/2023.
//

import SwiftUI

struct AboutView: View {
    
    @AppStorage("isPrenium") var isPrenium: Bool = false
    var free: String = "Gratuite"
    var prenium: String = "Payante"

    var body: some View {
        List {
            HStack {
                Image(systemName: "square.on.square")
                Text("Version actuelle: \(isPrenium ? prenium : free)")
            }
            Text(isPrenium ? "Félicitations !" : "C'est... OK ?")
            Text(isPrenium ? "• Charte graphique colorée" : "• Charte graphique Noir/Blanc")
            Text(isPrenium ? "• Image des personnages" : "• Pas d'image mais les initiales")
            Button(isPrenium ? "Version gratuite" : "Version payante") {
                self.isPrenium.toggle()
            }

        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
