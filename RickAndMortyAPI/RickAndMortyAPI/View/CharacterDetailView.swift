//
//  CharacterDetailView.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 16/04/2023.
//

import SwiftUI
import Kingfisher

struct CharacterDetailView: View {
    
    @State var character: Character
    @AppStorage("isPrenium") var isPrenium: Bool = false

    var body: some View {
        
        let characterDetails: [(systemName: String, text: String)] = [
            ("numbersign", character.id!),
            ("person", character.name),
            ("staroflife", character.status),
            ("curlybraces", character.species),
            ("figure.mind.and.body", character.gender)
        ]
        
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(isPrenium ? "banner" : "banner_noir_blanc")
                    .resizable()
                    .frame(height: 225)
                    .clipped()
                HStack(alignment: .bottom) {
                    //Règle métier 2 : les personnages doivent avoir leur nom affiché en majuscules
                    //Règle métier 3 : pour mettre rick et morty en avant, les personnages dont l’espèce est ‘Human’ doivent aussi avoir leur prénom en majuscules
                    let firstName = character.name.components(separatedBy: " ").first!.lowercased()
                    let lastName = character.name.components(separatedBy: " ").dropFirst().joined(separator: " ").uppercased()
                    let customName = character.species == "Human" ? character.name.uppercased() : firstName + " " + lastName
                    Text(customName)
                    Spacer()
                    //Règle métier 4 : En mode "Gratuite", l'application affiche l'initiale du prénom du personnage à la place de son image
                    if(isPrenium) {
                        let image = character.image
                        let url = URL(string: image)
                        KFImage(url)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.black, lineWidth: 1)
                            )
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
                }
                .padding(EdgeInsets.init(top: 0, leading: 18, bottom: 0, trailing: 18))
                .offset(y: 40)
            }
            Rectangle()
                .frame(height: 40)
                .foregroundColor(.clear)
            Divider()
                .frame(height: 2)
                .padding(EdgeInsets.init(top: 0, leading: 15, bottom: 0, trailing: 15))
                .overlay(Color.black.opacity(0.2))
            Spacer()
            VStack(alignment: .leading) {
                //Utilisation d'un tableau de tuples afin de simplifier le code
                ForEach(characterDetails, id: \.text) { detail in
                    HStack {
                        Image(systemName: detail.systemName)
                        Text(detail.text)
                    }
                }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.top)
            .onAppear{}
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(id: "1", name: "Rick", image: "Je suis une image", status: "Alive", species: "Human", type: "Type", gender: "Male"))
    }
}
