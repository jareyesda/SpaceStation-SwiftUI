//
//  NetworkManager.swift
//  SpaceStation-SwiftUI
//
//  Created by Juan Reyes on 8/20/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    // Published (I like to think of them as "dynamic") variables
    @Published var spaceStations = [SpaceStation]()
    @Published var availableURL = String()
    
    // Fetching JSON and decoding from URL
    func fetchData(urlString: String) {
        
        guard let url = URL(string: urlString) else {
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
                            
                            // Changing availableURL based on null values -- This is a special case exclusive to this API
                            if let nextURL = results!.next {
                                self.availableURL = nextURL
                            } else if let previousURL = results!.previous {
                                self.availableURL = previousURL
                            }
                            
                        }
                    }
                
            } else {
                // Error handling
                print(error!)
            }
        }.resume()
    }
    
}
