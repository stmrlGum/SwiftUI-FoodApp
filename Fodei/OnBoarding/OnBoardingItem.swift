//
//  OnBoardingItem.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

struct OnBoardingItem: View {
    let item: OnBoardingModel
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(item.image)
                .padding(.bottom, item.offset)
            VStack(alignment: .center, spacing: 0) {
                Text(item.title)
                    .font(.interSemiBold(size: 24))
                    .frame(height: 36)
                    .foregroundStyle(Color(#colorLiteral(red: 0.1215686275, green: 0.1607843137, blue: 0.2156862745, alpha: 1)))
                Text(item.subtitle)
                    .font(.interRegular(size: 12))
                    .padding(.top, 16)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(#colorLiteral(red: 0.2941176471, green: 0.3333333333, blue: 0.3882352941, alpha: 1)))
                Spacer()
            }
            .frame(height: 201)

        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let items: [OnBoardingModel] = [
        OnBoardingModel(image: "TrackingMaps",
                        title: "Nearby restaurants",
                        subtitle: "You don't have to go far to find a good restaurant,\nhave provided all the restaurants that is\nnear you",
                        offset: 79.24),
        
        OnBoardingModel(image: "Orderillustration",
                        title: "Select the Favorites Menu",
                        subtitle: "Now eat well, don't leave the house,You can\nchoose your favorite food only with\none click",
                        offset: 16.16),
        
        OnBoardingModel(image: "SafeFood",
                        title: "Good food at a cheap price",
                        subtitle: "You can eat at expensive restaurants with\naffordable price",
                        offset: 70.48)
    ]
    OnBoardingItem(item: items[1])
}
