//
//  ApexPredator.swift
//  JP Apex Predators
//
//  Created by NazarStf on 16.07.2023.
//

import Foundation
import SwiftUI

struct ApexPredator: Codable, Identifiable {
	let id: Int
	let name: String
	let type: String
	let movies: [String]
	let movieScenes: [MovieScene]
	let link: String
	
	func typeOverlay() -> Color {
		switch type {
		case "land" : return .brown
		case "air" : return .cyan
		case "sea" : return .blue
		default : return .brown
		}
	}
}

struct MovieScene: Codable, Identifiable {
	let id: Int
	let movie: String
	let sceneDescription: String
}
