//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by NazarStf on 17.07.2023.
//

import SwiftUI

struct PredatorDetail: View {
	
	let predator: ApexPredator
	@State private var isImageFullScreen = false
	
	var body: some View {
		ScrollView {
			VStack(alignment: .trailing) {
				Image(predator.type)
					.resizable()
					.scaledToFit()
				
				Image(predator.name.lowercased().filter { $0 != " " })
					.resizable()
					.scaledToFit()
					.frame(width: isImageFullScreen ? UIScreen.main.bounds.width : UIScreen.main.bounds.width/1.5,
						   height: isImageFullScreen ? UIScreen.main.bounds.height : UIScreen.main.bounds.height/4)
					.shadow(color: .black, radius: 6, x: 0, y: 0)
					.offset(y: -230)
					.rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
					.onTapGesture {
						withAnimation {
							self.isImageFullScreen.toggle()
						}
					}
								
				VStack(alignment: .leading) {
					Text(predator.name)
						.font(.largeTitle)
						.padding(.bottom, 8)
					
					Text("Appears In:")
						.font(.title3)
					
					ForEach(predator.movies, id: \.self) { movie in
						Text("•" + movie)
							.font(.subheadline)
					}
					
					Text("Movie Moments")
						.font(.title)
						.padding(.top, 15)
					
					ForEach(predator.movieScenes) { scene in
						Text(scene.movie)
							.font(.title2)
							.padding([.top, .bottom], 1)
						
						Text(scene.sceneDescription)
							.padding(.bottom, 15)
					}
					
					Text("Read More:")
						.font(.caption)
					Link(predator.link, destination: URL(string: predator.link)!)
						.font(.caption)
						.foregroundColor(.blue)
				}
				.padding(.top, -230)
				.padding()
			}
		}
		.edgesIgnoringSafeArea(.top)
	}
}

struct PredatorDetail_Previews: PreviewProvider {
    static var previews: some View {
		let movieScene1 = MovieScene(id: 3, movie: "Jurassic Park III", sceneDescription: "A young adult Tyrannosaurus appears in Jurassic Park 3. According to the official size charts, it is 37 feet long and 14.5 feet tall. When Alan Grant and the other survivors escape the Spinosaurus, they encounter the creature who is just feeding on another dinosaur. The group runs back towards the Spinosaurus and a huge battle occurs between the Tyrannosaurus and the Spinosaurus. The Spinosaurus kills the T-Rex by snapping its neck in its powerful jaws.")
		
		let movieScene2 = MovieScene(id: 4, movie: "Jurassic World", sceneDescription: "The T-rex mainly stayed in her paddock for most of the incident until Claire Dearing told Lowery Cruthers to open her enclosure's door and let her out after Claire's nephew Gray Mitchell told her that another dinosaur was needed to help kill the Indominus rex. Using a flare, Claire guided the T. rex to the Indominus and threw the flare at the hybrid. Crashing through Main Street's mounted Spinosaurus skeleton, the Tyrannosaurus challenged the I-rex with an almighty bellow, not knowing exactly what this new creature was but identifying it as a threat. When the hybrid did not back down, the T-rex attacked her viciously.\n\nInitially, the Tyrannosaurus had the advantage, landing several bites to the I. rex's neck, but the elder dinosaur was fighting from a territorial standpoint whilst the hybrid was aiming to kill and the tables were quickly turned, with the T-rex thrown down against the Jurassic Traders Outpost, destroying it in the process and almost killing Owen Grady, Gray, and Zach Mitchell.\n\nHowever, before the Indominus could kill her, Blue, the surviving Velociraptor of the battle, intervened by lunging onto the I. rex, giving the T. rex time to get up off the ground, now fighting to kill. With Blue latched onto the hybrid, the old T. rex grabbed the Indominus dragging her and slamming her body into the nearby buildings of Main Street. At one point, Blue rode on the tyrannosaur's back while she smashed the I. rex into one of the buildings. She finally flung the hybrid near the edge of the Jurassic World Lagoon where the Mosasaurus that resided there leaped out of the water to snatch the I-rex and drag it underwater, drowning the hybrid. After the fight, the T. rex and Blue looked at each other for a brief moment. Despite a previous animosity and hostile encounter with raptors, the T-rex decided to spare Blue either because she is too injured and exhausted, or because she doesn't see her as a threat. Either way, the old Tyrannosaurus limps away to recover from the injuries she sustained from the fight.\n\nIn the aftermath of the incident, the T-rex stomped onto the Control Center helipad and took in the ruined park that had become void of any people, warming her wounds in the rising sun before letting out her signature roar, claiming the island as hers once again.")
		
		let predator = ApexPredator(id: 3, name: "Tyrannosaurus Rex", type: "land", movies: ["Jurassic Park", "The Lost World: Jurassic Park", "Jurassic Park III", "Jurassic World", "Jurassic World: Fallen Kingdom"], movieScenes: [movieScene1, movieScene2], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
		PredatorDetail(predator: predator)
    }
}
