//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by NazarStf on 16.07.2023.
//

import SwiftUI

struct ContentView: View {
	
	let apController = PredatorController()
	
    var body: some View {
		NavigationView {
			List {
				ForEach(apController.apexPredators) { predator in
					NavigationLink(destination: PredatorDetail(predator: predator)) {
						PredatorRow(predator: predator)
					}
				}
			}
			.navigationTitle("Apex Predators")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
