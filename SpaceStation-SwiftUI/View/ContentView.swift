//
//  ContentView.swift
//  SpaceStation-SwiftUI
//
//  Created by Juan Reyes on 8/19/21.
//

import SwiftUI


struct ContentView: View {
    
    // Variables
    @ObservedObject var networkManager = NetworkManager()
    @State var buttonText = "Next"
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                // Creating grid view with two items per row
                LazyVGrid(columns: [
                    GridItem(.fixed(200), spacing: 20),
                    GridItem(.fixed(200))
                ], spacing: 20, content: {
                    // Populating grid asynchronously through observed object
                    ForEach(networkManager.spaceStations, id: \.self) { spaceStation in
                        // Preparing for the "segue"
                        NavigationLink(
                            // Declaring destination
                            destination: DetailView(
                                imageView: RemoteImage(url: spaceStation.imageURL),
                                nameLabel: spaceStation.name,
                                ownerLabel: spaceStation.owners.first!.name,
                                foundedLabel: spaceStation.founded,
                                statusLabel: spaceStation.status.name,
                                descriptionLabel: spaceStation.resultDescription),
                            // Setting content for the grid view
                            label: {
                                // Populating with custom cell view
                                SpaceStationCellView(
                                    imageURL: spaceStation.imageURL,
                                    nameLabel: spaceStation.name,
                                    ownerLabel: spaceStation.owners.first!.name
                                )
                            })
                    }
                })
            }
            .navigationTitle("Space Stations")
            // Navigation bar configuration
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    // When button is pressed, fetch data from available url
                    Button(buttonText) {
                        networkManager.fetchData(urlString: networkManager.availableURL)
                        
                        // Conditional statements on button's label
                        if buttonText == "Next" {
                            buttonText = "Previous"
                        } else {
                            buttonText = "Next"
                        }
                        
                    }
                }
            }
        }
        .onAppear(perform: {
            networkManager.fetchData(urlString: "https://ll.thespacedevs.com/2.2.0/spacestation/?format=json&limit=10")
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



