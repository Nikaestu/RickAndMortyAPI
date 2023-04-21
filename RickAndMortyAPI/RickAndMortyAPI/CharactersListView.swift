//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 16/04/2023.
//

import SwiftUI
import Kingfisher

struct CharactersListView: View {
    
    @State private var characters: [Character] = []
    @AppStorage("isPrenium") var isPrenium: Bool = false

    var body: some View {
        NavigationView {
            List(characters, id: \.id) { character in
                NavigationLink(
                    destination: CharacterDetailView(characterId: character.id!, character: character),
                    label: {
                        HStack {
                            if (isPrenium == true) {
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
                            Text(character.name)
                        }
                    }
                )
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                Text("Liste des personnages")
                    .font(.title)
                }
            }
            .onAppear(perform: {Network.shared.apollo.fetch(query: GetCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: 1))) {
                result in
                
                switch result {
                case.failure(let error):
                    print(error)
                case.success(let GraphQLResult):
                    if let charactersData = GraphQLResult.data?.characters?.results {
                        DispatchQueue.main.async {
                            let characters = charactersData.map{ charactersData in
                                Character(id: (charactersData?.id)!, name: (charactersData?.name)!, image: (charactersData?.image)!, status: (charactersData?.status)!, species: (charactersData?.species)!, type: (charactersData?.type)!, gender: (charactersData?.gender)!)
                            }
                            self .characters = characters
                        }
                    }
                }
            }
            })
        }
    }
}

struct charactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
