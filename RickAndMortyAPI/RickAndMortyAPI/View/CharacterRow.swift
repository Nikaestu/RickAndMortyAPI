//
//  CharacterRow.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 22/04/2023.
//

import SwiftUI
import Kingfisher

struct CharacterRow: View {
    
    @State var character: Character
    @AppStorage("isPrenium") var isPrenium: Bool = false
    
    var body: some View {
        HStack {
            //Règle métier 4 : En mode "Gratuite", l'application affiche l'initiale du prénom du personnage à la place de son image
            if (isPrenium) {
                if let image = character.image,
                   let url = URL(string: image) {
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                } else {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                }
            } else {
                let letter: String = String(character.name.prefix(1))
                ZStack {
                    Text(letter)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 50, height: 50)
                    Text(letter)
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            //Règle métier 2 : les personnages doivent avoir leur nom affiché en majuscules
            //Règle métier 3 : pour mettre rick et morty en avant, les personnages dont l’espèce est ‘Human’ doivent aussi avoir leur prénom en majuscules
            let firstName = character.name.components(separatedBy: " ").first!.lowercased()
            let lastName = character.name.components(separatedBy: " ").dropFirst().joined(separator: " ").uppercased()
            let customName = character.species == "Human" ? character.name.uppercased() : firstName + " " + lastName
            Text(customName)
        }
    }
}

struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character(id: "1", name: "Rick", image: "Je suis une image", status: "Alive", species: "Human", type: "Type", gender: "Male"))
    }
}
