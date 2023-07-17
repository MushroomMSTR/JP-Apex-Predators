//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by NazarStf on 16.07.2023.
//

import Foundation

struct ApexPredator: Codable, Identifiable {
	let id: Int
	let name: String
	let type: String
	let movies: [String]
	let movieScenes: [MovieScene]
	let link: String
}

struct MovieScene: Codable {
	let id: Int
	let movie: String
	let sceneDescription: String
}
