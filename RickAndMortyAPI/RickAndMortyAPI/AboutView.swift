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
            if(isPrenium == true){
                HStack {
                    Image(systemName: "square.on.square")
                    Text("Version actuelle: \(prenium)")
                }
                Text("Félicitations !")
                Text("• Charte graphique colorée")
                Text("• Image des personnages")
                Button("Version gratuite") {
                    self.isPrenium = !isPrenium
                }
            } else {
                HStack {
                    Image(systemName: "square.on.square")
                    Text("Version actuelle: \(free)")
                }
                Text("C'est... OK ?")
                Text("• Charte graphique Noir/Blanc")
                Text("• Pas d'image mais les initiales")
                Button("Version payante") {
                    self.isPrenium = !isPrenium
                }
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
