//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by NazarStf on 16.07.2023.
//

import SwiftUI

// MARK: - ContentView
// The main view of the application that displays a list of apex predators.
struct ContentView: View {
	
	// PredatorController instance to manage predator data
	let apController = PredatorController()
	
	// State variables for sorting and filtering options
	@State var sortAlphabet = false
	@State var currentFilter = "All"
	@State var currentMovieFilter = "All"
	@State var searchText = ""
	
	var body: some View {
		
		// Apply the current type filter to the PredatorController
		apController.filterBy(type: currentFilter)
		
		return NavigationView {
			// Create a List of predators, sorting and filtering based on the current options
			List {
				ForEach(sortAlphabet ? apController.sortedByAlphabet() : apController.sortedByMovieAppearance()) { predator in
					// Filter the list based on the search text and current movie filter
					if (searchText.isEmpty || predator.name.lowercased().contains(searchText.lowercased()) || predator.movies.contains(where: { $0.lowercased().contains(searchText.lowercased()) })) && (currentMovieFilter == "All" || predator.movies.contains(currentMovieFilter)) {
						// Create a NavigationLink to the detail view for each predator
						NavigationLink(destination: PredatorDetail(predator: predator)) {
							PredatorRow(predator: predator)
						}
					}
				}
			}
			// Add a navigation title, search bar, and toolbar items for sorting and filtering
			.navigationTitle("Apex Predators")
			.searchable(text: $searchText)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					// Button to toggle between sorting by alphabet and sorting by movie appearance
					Button {
						withAnimation {
							sortAlphabet.toggle()
						}
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
				ToolbarItem(placement: .navigationBarTrailing) {
					// Menu to select the type filter and movie filter
					Menu {
						Picker("Filter", selection: $currentFilter.animation()) {
							ForEach(apController.typeFilters, id: \.self) { type in
								HStack {
									Text(type)
									
									Spacer()
									
									Image(systemName: apController.typeIcon(for: type))
								}
							}
						}
						Picker("Filter by Movie", selection: $currentMovieFilter.animation()) {
							ForEach(["All"] + apController.movieFilters, id: \.self) { movie in
								Text(movie)
							}
						}
					} label: {
						Image(systemName: "slider.horizontal.3")
							.foregroundColor(.gray)
					}
				}
			}
		} .accentColor(.white)
	}
}


// MARK: - ContentView_Previews
// SwiftUI preview provider for ContentView
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
