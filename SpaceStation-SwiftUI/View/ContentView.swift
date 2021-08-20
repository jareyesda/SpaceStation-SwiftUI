//
//  ContentView.swift
//  SpaceStation-SwiftUI
//
//  Created by Juan Reyes on 8/19/21.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.fixed(200), spacing: 20),
                    GridItem(.fixed(200))
                ], spacing: 20, content: {
                    ForEach(networkManager.spaceStations, id: \.self) { spaceStation in
                        VStack(alignment: .center) {
                            // Image Placeholder
                            RemoteImage(url: spaceStation.imageURL)
                                .frame(width: 150, height: 150, alignment: .center)
                                .padding()
                            
                            // Space Station Info Placeholder
                            Text(spaceStation.name)
                                .bold()
                            Text(spaceStation.owners.first!.name)
                        }
                    }
                })
            }.navigationTitle("Space Stations")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

