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
    let name: String
    let owner: String
    
    var body: some View {
        VStack {
            Spacer()
            RemoteImage(url: imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
            Text(name)
                .frame(width: 200, height: 75, alignment: .center)
            Text(owner)
                .frame(width: 200, height: 75, alignment: .center)
            Spacer()
        }

    }
}
