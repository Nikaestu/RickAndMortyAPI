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
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(isPrenium ? "banner" : "banner_noir_blanc")
                    .resizable()
                    .frame(height: 225)
                    .clipped()
                HStack(alignment: .bottom) {
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
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
                HStack {
                    Image(systemName: "numbersign")
                    Text(character.id!)
                }
                HStack {
                    Image(systemName: "person")
                    Text(character.name)
                }
                HStack {
                    Image(systemName: "staroflife")
                    Text(character.status)
                }
                HStack {
                    Image(systemName: "curlybraces")
                    Text(character.species)
                }
                HStack {
                    Image(systemName: "figure.mind.and.body")
                    Text(character.gender)
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
