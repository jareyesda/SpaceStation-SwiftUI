//
//  NetworkManager.swift
//  SpaceStation-SwiftUI
//
//  Created by Juan Reyes on 8/20/21.
//

import Foundation

class NetworkManager: ObservableObject {
    var webURL = "https://ll.thespacedevs.com/2.2.0/spacestation/?format=json&limit=10"
    
    @Published var spaceStations = [SpaceStation]()
    @Published var availableURL = String()
    
    func fetchData() {
        
        guard let url = URL(string: webURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                guard let jsonData = data else { return }
                    do {
                        let results = try? decoder.decode(Response.self, from: jsonData)
                        DispatchQueue.main.async {
                            self.spaceStations = results!.results
                            
                            if let nextURL = results!.next {
                                self.availableURL = nextURL
                            } else if let previousURL = results!.previous {
                                self.availableURL = previousURL
                            }
                            
                        }
                    }
                
            } else {
                print(error!)
            }
        }.resume()
    }
    
}
