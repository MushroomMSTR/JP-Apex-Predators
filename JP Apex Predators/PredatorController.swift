//
//  PredatorController.swift
//  JP Apex Predators
//
//  Created by NazarStf on 17.07.2023.
//

import Foundation

class PredatorController {
	var apexPredators: [ApexPredator] = []
	
	init () {
		decodeApexPredatorData()
	}
	
	func decodeApexPredatorData() {
		if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
			do {
				let data = try Data(contentsOf: url)
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				apexPredators = try decoder.decode([ApexPredator].self, from: data)
			} catch {
				print("Error decoding JSON data: \(error)")
			}
		}
	}
	
	func sortedByAlphabet() -> [ApexPredator] {
		return apexPredators.sorted(by: { $0.name < $1.name })
	}
	
	func sortedByMovieAppearance() -> [ApexPredator] {
		return apexPredators.sorted(by: { $0.id < $1.id })
	}
}

