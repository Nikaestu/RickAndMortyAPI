//
//  RickAndMortyAPITests.swift
//  RickAndMortyAPITests
//
//  Created by Nikaestu on 16/04/2023.
//

import XCTest
@testable import RickAndMortyAPI

final class RickAndMortyAPITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // Mes tests
    
    // Model
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
        charactersListView.data.characters = characters // On injecte la liste de personnages dans CharactersListView
            
        // On vérifie que la liste de personnages est bien affichée
        let expectedCharactersCount = 2 // On s'attend à ce que la liste contienne deux personnages
        let actualCharactersCount = charactersListView.data.characters.count // On récupère le nombre de personnages affichés
        XCTAssertEqual(expectedCharactersCount, actualCharactersCount, "La liste de personnages n'a pas été correctement affichée")
    }

}
