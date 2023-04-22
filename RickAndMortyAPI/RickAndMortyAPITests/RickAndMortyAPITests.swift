//
//  RickAndMortyAPITests.swift
//  RickAndMortyAPITests
//
//  Created by Nikaestu on 16/04/2023.
//

import XCTest
@testable import RickAndMortyAPI

final class RickAndMortyAPITests: XCTestCase {

    // Mes tests
    
    // Modèle
    // Valide
    func testCharacterInitialization() {
        let id = "1"
        let name = "Rick Sanchez"
        let image = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        let status = "Alive"
        let species = "Human"
        let type = "Human with alcohol addiction"
        let gender = "Male"
        
        let character = Character(id: id, name: name, image: image, status: status, species: species, type: type, gender: gender)
        
        XCTAssertEqual(character.id, id)
        XCTAssertEqual(character.name, name)
        XCTAssertEqual(character.image, image)
        XCTAssertEqual(character.status, status)
        XCTAssertEqual(character.species, species)
        XCTAssertEqual(character.type, type)
        XCTAssertEqual(character.gender, gender)
    }

    // Non valide
    func testInitWithInvalidId() {
        let character = Character(id: "", name: "John Doe", image: "image.png", status: "Alive", species: "Human", type: "", gender: "Male")

        XCTAssertNil(character, "Character should not be created with an empty id")
    }
    
    //Service + Règle métier 1
    func testFetchCharacters() {
        let service = CharacterService()
        service.fetchCharacters()

        // Vérifier si la pagination est correctement gérée
        XCTAssert(service.currentPage == 1)

        // Vérifier si les données sont correctement filtrées
        let statusUnknown = service.characters.contains { $0.status == "unknown" }
        XCTAssert(statusUnknown == false)
    }
    
    // Vue Details
    func testInitCharacterDetailView() throws {
        let character = Character(id: "1", name: "Rick", image: "Je suis une image", status: "Alive", species: "Human", type: "Type", gender: "Male")
        let view = CharacterDetailView(character: character)

        XCTAssertEqual(view.character.id, "1")
        XCTAssertEqual(view.character.name, "Rick")
        XCTAssertEqual(view.character.image, "Je suis une image")
        XCTAssertEqual(view.character.status, "Alive")
        XCTAssertEqual(view.character.species, "Human")
        XCTAssertEqual(view.character.type, "Type")
        XCTAssertEqual(view.character.gender, "Male")
    }

    // Vue Liste
    func testCharactersListDisplayed() {
        // On crée une liste de personnages prédéfinie
        let characters = [
            Character(id: "1", name: "Rick", image: "Je suis une image", status: "Alive", species: "Human", type: "Type", gender: "Male"),
            Character(id: "2", name: "Morty", image: "Je suis une image", status: "Alive", species: "Human", type: "Type", gender: "Male")
        ]

        let charactersListView = CharactersListView()
        var viewChar = charactersListView.data.characters

        viewChar = characters
        
        // On vérifie que la liste de personnages est bien affichée
        let expectedCharactersCount = 2 // On s'attend à ce que la liste contienne deux personnages
        let actualCharactersCount = viewChar.count // On récupère le nombre de personnages affichés
        XCTAssertEqual(expectedCharactersCount, actualCharactersCount, "La liste de personnages n'a pas été correctement affichée")
    }

}
