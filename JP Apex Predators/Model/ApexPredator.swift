//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by NazarStf on 16.07.2023.
//

import Foundation
import SwiftUI

// MARK: - ApexPredator Struct
// This struct represents an apex predator in the Jurassic Park universe.
// It conforms to the Codable protocol for easy encoding and decoding from JSON, and the Identifiable protocol for unique identification in SwiftUI views.
struct ApexPredator: Codable, Identifiable {
	
	// Unique identifier for each predator
	let id: Int
	
	// The name of the predator
	let name: String
	
	// The type of the predator (land, air, or sea)
	let type: String
	
	// The list of movies that the predator appears in
	let movies: [String]
	
	// The specific scenes that the predator appears in within the movies
	let movieScenes: [MovieScene]
	
	// The link to more information about the predator
	let link: String
	
	// This function returns a color based on the type of the predator, which can be used for UI purposes.
	func typeOverlay() -> Color {
		switch type {
		case "land" : return .brown
		case "air" : return .cyan
		case "sea" : return .blue
		default : return .brown
		}
	}
}

// MARK: - MovieScene Struct
// This struct represents a specific scene that an apex predator appears in.
// It also conforms to the Codable and Identifiable protocols.
struct MovieScene: Codable, Identifiable {
	
	// Unique identifier for each scene
	let id: Int
	
	// The movie that the scene is from
	let movie: String
	
	// A description of the scene
	let sceneDescription: String
}
