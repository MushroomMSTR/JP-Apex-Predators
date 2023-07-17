//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by NazarStf on 16.07.2023.
//

import SwiftUI

struct ContentView: View {
	
	let apController = PredatorController()
	@State var sortAlphabet = false
	
    var body: some View {
		
		if sortAlphabet {
			apController.sortByAlphabet()
		} else {
			apController.sortByMovieAppearance()
		} // Can you refactor my code, I dont want use return word to my NavigationView
		
		return NavigationView {
			List {
				ForEach(apController.apexPredators) { predator in
					NavigationLink(destination: PredatorDetail(predator: predator)) {
						PredatorRow(predator: predator)
					}
				}
			}
			.navigationTitle("Apex Predators")
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button {
						sortAlphabet.toggle()
					} label: {
						if sortAlphabet {
							Image(systemName: "film")
								.foregroundColor(.gray)
						} else {
							Image(systemName: "textformat")
								.foregroundColor(.gray)
						}
					}
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
