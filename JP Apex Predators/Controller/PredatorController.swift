//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by NazarStf on 17.07.2023.
//

import Foundation

class PredatorController {
	private var allApexPredators: [ApexPredator] = []
	var apexPredators: [ApexPredator] = []
	let typeFilters = ["All", "Land", "Air", "Sea"]
	
	init () {
		decodeApexPredatorData()
	}
	
	var movieFilters: [String] {
		var movies: [String] = []
		allApexPredators.forEach { predator in
			movies.append(contentsOf: predator.movies)
		}
		return Array(Set(movies)).sorted()
	}
	
	func filterBy(movie: String) {
		apexPredators = allApexPredators.filter {
			$0.movies.contains(movie)
		}
	}
	
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
	
	func typeIcon(for type: String) -> String {
		switch type {
		case "All" : return "square.stack.3d.up.fill"
		case "Land" : return "leaf.fill"
		case "Air" : return "wind"
		case "Sea" : return "drop.fill"
		default : return "questionmark"
		}
	}
	
	func filterBy(type: String) {
		switch type {
		case "Land", "Air", "Sea" :
			apexPredators = allApexPredators.filter {
				$0.type == type.lowercased()
			}
		default : apexPredators = allApexPredators
		}
	}
	
	func sortedByAlphabet() -> [ApexPredator] {
		return apexPredators.sorted(by: { $0.name < $1.name })
	}
	
	func sortedByMovieAppearance() -> [ApexPredator] {
		return apexPredators.sorted(by: { $0.id < $1.id })
	}
}

