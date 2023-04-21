//
//  MenuView.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 18/04/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            CharactersListView()
            .tabItem {
                Label("Personnages", systemImage: "person.crop.square.fill.and.at.rectangle")
            }
            AboutView()
            .tabItem {
                Label("A propos", systemImage: "info.bubble.fill")
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
