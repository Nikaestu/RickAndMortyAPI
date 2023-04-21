//
//  Network.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 16/04/2023.
//

import Foundation
import Apollo

class Network {
    static let  shared = Network()
    private init() {
        
    }
    lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}
