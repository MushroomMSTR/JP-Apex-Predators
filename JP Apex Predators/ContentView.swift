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
	@State var currentFilter = "All"
	@State var searchText = ""
	
	var body: some View {
		NavigationView {
			List {
				ForEach(sortAlphabet ? apController.sortedByAlphabet() : apController.sortedByMovieAppearance()) { predator in
					if searchText.isEmpty || predator.name.lowercased().contains(searchText.lowercased()) {
						NavigationLink(destination: PredatorDetail(predator: predator)) {
							PredatorRow(predator: predator)
						}
					}
				}
			}
			.navigationTitle("Apex Predators")
			.searchable(text: $searchText)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
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
					} label: {
						Image(systemName: "slider.horizontal.3")
							.foregroundColor(.gray)
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
