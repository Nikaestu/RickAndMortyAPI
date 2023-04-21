//
//  Character.swift
//  RickAndMortyAPI
//
//  Created by Nikaestu on 16/04/2023.
//

import Foundation

class Character {
    
    var id: String?
    var name: String
    var image: String
    var status: String
    var species: String
    var type: String?
    var gender: String

    init(id: String, name: String, image: String, status: String, species: String, type: String, gender: String) {
        self.id = id
        self.name = name
        self.image = image
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
    }
    
}
