//
//  SpaceStationCellView.swift
//  SpaceStation-SwiftUI
//
//  Created by Juan Reyes on 8/20/21.
//

import Foundation
import SwiftUI

struct SpaceStationCellView: View {
    
    let imageURL: String
    let nameLabel: String
    let ownerLabel: String
    
    var body: some View {
        VStack(alignment: .center) {
            // Image Placeholder
            // ** Fetched asynchronously **
            RemoteImage(url: imageURL)
                .frame(width: 150, height: 150, alignment: .center)
                .padding()
            
            // Space Station Info Placeholder
            Text(nameLabel)
                .bold()
                .foregroundColor(.black)
            Text(ownerLabel)
                .foregroundColor(.black)
        }
    }
}
