//
//  TopCaruselItem.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import SwiftUI
import CoreLocation

struct TopCaruselItem: View {
    
    let item: TopСarousel
    var onPress: () -> ()
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(item.image)
            VStack(alignment: .leading, spacing: 0) {
                Spacer()
                Text(item.title)
                    .foregroundStyle(.white)
                    .font(.interBold(size: 16))
                    .frame(height: 19)
                Text(item.subtitle)
                    .foregroundStyle(.white)
                    .font(.interMedium(size: 7))
                    .frame(height: 19)
                    .padding(.top, 3)
                HStack(spacing: 0) {
                    Text("Order")
                        .font(.interBold(size: 8))
                        .padding(.trailing, 3)
                        .foregroundStyle(.white)
                    Image("whiteButton")
                }
                .padding(.top, 5)

            }
            .padding(.leading, 20)
            .padding(.bottom, 11)
        }
        .onTapGesture {
            onPress()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TopCaruselItem(item: TopСarousel(image: "burgers", title: "Flash Offer", subtitle: "We are here with the best\ndeserts intown.", position: CLLocationCoordinate2D(latitude: 43.1155, longitude: 131.8855))) {
        print("tapped")
    }
        .frame(height: 120)
}
