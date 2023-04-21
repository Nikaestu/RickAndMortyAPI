//
//  CharacterService.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 21/04/2023.
//

import SwiftUI

class CharacterService: ObservableObject {
    
    @Published var characters: [Character] = []
    public private(set) var totalPage: Int?

    public var currentPage = 1 {
        didSet {
            fetchCharacters()
        }
    }
    
    public var shouldDisplayNextPage: Bool {
        if characters.isEmpty == false,
               let totalPages = totalPage,
               currentPage < totalPages {
                return true
            }
            return false
        }

    func fetchCharacters(){
        Network.shared.apollo.fetch(query: GetCharactersQuery(page: GraphQLNullable<Int>(integerLiteral: currentPage))) {
            result in
            switch result {
            case.failure(let error):
                print(error)
            case.success(let GraphQLResult):
                self.totalPage = GraphQLResult.data?.characters?.info?.pages
                //Règle métier 1 : les personnages au statut inconnu doivent être enlevés de la liste de résultat
                if let charactersData = GraphQLResult.data?.characters?.results?.filter({ $0?.status != "unknown" }).compactMap({ characterData in
                    Character(id: (characterData?.id)!, name: (characterData?.name)!, image: (characterData?.image)!, status: (characterData?.status)!, species: (characterData?.species)!, type: (characterData?.type)!, gender: (characterData?.gender)!)}) {
                    self.characters.append(contentsOf: charactersData)
                }
            }
        }
    }
}
