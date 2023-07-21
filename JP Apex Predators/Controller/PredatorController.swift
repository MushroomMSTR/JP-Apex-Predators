//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by NazarStf on 17.07.2023.
//

import Foundation

// MARK: - PredatorController
// This class acts as a controller for managing the ApexPredator data.
class PredatorController {
	
	// Private variable to store all apex predators
	private var allApexPredators: [ApexPredator] = []
	
	// Public variable to store filtered apex predators
	var apexPredators: [ApexPredator] = []
	
	// List of possible type filters
	let typeFilters = ["All", "Land", "Air", "Sea"]
	
	// Initializer that decodes the ApexPredator data
	init () {
		decodeApexPredatorData()
	}
	
	// Computed property to generate unique movie filters
	var movieFilters: [String] {
		var movies: [String] = []
		allApexPredators.forEach { predator in
			movies.append(contentsOf: predator.movies)
		}
		return Array(Set(movies)).sorted()
	}
	
	// Function to filter apex predators by movie
	func filterBy(movie: String) {
		apexPredators = allApexPredators.filter {
			$0.movies.contains(movie)
		}
	}
	
	// Function to decode ApexPredator data from a JSON file
	func decodeApexPredatorData() {
		if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				allApexPredators = try decoder.decode([ApexPredator].self, from: data)
				apexPredators = allApexPredators
			} catch {
				print("Error decoding JSON data: \(error)")
			}
		}
	}
	
	// Function to get the icon name for each type filter
	func typeIcon(for type: String) -> String {
		switch type {
		case "All" : return "square.stack.3d.up.fill"
		case "Land" : return "leaf.fill"
		case "Air" : return "wind"
		case "Sea" : return "drop.fill"
		default : return "questionmark"
		}
	}
	
	// Function to filter apex predators by type
	func filterBy(type: String) {
		switch type {
		case "Land", "Air", "Sea" :
			apexPredators = allApexPredators.filter {
				$0.type == type.lowercased()
			}
		default : apexPredators = allApexPredators
		}
	}
	
	// Function to sort apex predators alphabetically
	func sortedByAlphabet() -> [ApexPredator] {
		return apexPredators.sorted(by: { $0.name < $1.name })
	}
	
	// Function to sort apex predators by movie appearance
	func sortedByMovieAppearance() -> [ApexPredator] {
		return apexPredators.sorted(by: { $0.id < $1.id })
	}
}
