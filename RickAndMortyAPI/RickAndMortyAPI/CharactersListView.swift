//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 16/04/2023.
//

import SwiftUI
import Kingfisher

struct CharactersListView: View {
    
    @StateObject private var data = CharacterService()
    @AppStorage("isPrenium") var isPrenium: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(data.characters, id: \.id) { character in
                    NavigationLink(
                        destination: CharacterDetailView(character: character),
                        label: {
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
                                    ZStack {
                                        let letter: String = String(character.name.prefix(1))
                                        Text(letter)
                                        Circle()
                                            .fill(Color.black)
                                            .frame(width: 50, height: 50)
                                        Text(letter)
                                            .font(.title)
                                            .foregroundColor(.white)
                                    }
                                }
                                //Règle métier 3 : pour mettre rick et morty en avant, les personnages dont l’espèce est ‘Human’ doivent aussi avoir leur prénom en majuscules
                                if(character.species == "Human") {
                                    Text(character.name.uppercased())
                                } else {
                                    Text(character.name)
                                }
                            }
                        }
                    )
                }
                if data.shouldDisplayNextPage {
                    nextPageView
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                Text("Liste des personnages")
                    .font(.title)
                }
            }
            .onAppear{data.fetchCharacters()}
        }
    }
    
    private var nextPageView: some View {
        HStack {
            Spacer()
            VStack {
                ProgressView()
                Text("Loading next page...")
            }
            Spacer()
        }
        .onAppear(perform: {
            data.currentPage += 1
        })
    }
}

struct charactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
