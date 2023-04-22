//
//  ContentView.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 16/04/2023.
//

import SwiftUI
import Kingfisher

struct CharactersListView: View {
    
    @StateObject var data = CharacterService()
    @AppStorage("isPrenium") var isPrenium: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(data.characters, id: \.id) { character in
                    NavigationLink(
                        destination: CharacterDetailView(character: character),
                        label: {CharacterRow(character: character)}
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
