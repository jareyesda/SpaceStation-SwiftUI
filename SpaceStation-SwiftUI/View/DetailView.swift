//
//  DetailView.swift
//  SpaceStation-SwiftUI
//
//  Created by Juan Reyes on 8/20/21.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    let imageView: RemoteImage
    let nameLabel: String
    let ownerLabel: String
    let foundedLabel: String
    let statusLabel: String
    let descriptionLabel: String
    
    var body: some View {
        VStack {
            imageView
                .frame(height: 300, alignment: .center)
                .padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
            Text(nameLabel)
                .font(.title)
                .padding()
            HStack {
                Text(ownerLabel)
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
            HStack {
                Text(foundedLabel)
                Spacer()
                Text(statusLabel)
            }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
            HStack {
                Text("Description:")
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
            ScrollView {
                Text(descriptionLabel)
                    .frame(alignment: .topLeading)
                    .padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
            }
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imageView: RemoteImage(url: "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/salyut25205_image_20190318095611.png"), nameLabel: "Name", ownerLabel: "Owner", foundedLabel: "Founded", statusLabel: "status", descriptionLabel: "description")
    }
}
