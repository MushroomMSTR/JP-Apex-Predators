//
//  PredatorRow.swift
//  JP Apex Predators
//
//  Created by NazarStf on 17.07.2023.
//

import SwiftUI

// MARK: - PredatorRow
// This view represents a single row in the list of apex predators.
struct PredatorRow: View {
	
	// The apex predator that the row will represent
	let predator: ApexPredator
	
	var body: some View {
		HStack {
			// Display an image of the predator
			Image(predator.name.lowercased().filter { $0 != " "})
				.resizable()
				.scaledToFit()
				.frame(width: 100, height: 100)
				.shadow(color: .white, radius: 0.5, x: 0, y: 0)
			
			VStack(alignment: .leading) {
				// Display the name of the predator
				Text(predator.name)
					.fontWeight(.semibold)
				// Display the type of the predator with a background color depending on the type
				Text(predator.type.capitalized)
					.font(.subheadline)
					.fontWeight(.semibold)
					.padding(.horizontal, 13)
					.padding(.vertical, 5)
					.overlay(
						RoundedRectangle(cornerRadius: 20)
							.fill(predator.typeOverlay().opacity(0.33))
						)
			}
		}
	}
}

// MARK: - PredatorRow_Previews
// SwiftUI preview provider for PredatorRow
struct PredatorRow_Previews: PreviewProvider {
    static var previews: some View {
		let movieScene = MovieScene(id: 3, movie: "Jurassic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
		
		let predator = ApexPredator(id: 3, name: "Tyrannosaurus Rex", type: "land", movies: ["Jurassic Park", "The Lost World: Jurassic Park", "Jurassic Park III", "Jurassic World", "Jurassic World: Fallen Kingdom"], movieScenes: [movieScene], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
		PredatorRow(predator: predator)
    }
}
