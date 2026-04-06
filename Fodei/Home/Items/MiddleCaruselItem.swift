//
//  MiddleCaruselItem.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import SwiftUI

struct MiddleCaruselItem: View {
    
    let item: MiddleCarousel
    var onPress: () -> ()
    
    var body: some View {
        ZStack {
            Color.white
            VStack(alignment: .leading) {
                Image(item.image)
                    .resizable()
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 8,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 8
                        )
                    )
                    .frame(width: 128, height: 103.3)
                Text(item.eat)
                    .font(.interSemiBold(size: 16))
                HStack(alignment: .top) {
                    Image("map")
                        .padding(.top, 0)
                    Text(item.place)
                        .font(.interMedium(size: 10))
                        .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding([.top, .horizontal], 10)
            .padding(.bottom, 20)
        }
        .cornerRadius(16)
        .frame(width: 148, height: 196)
    }
}

#Preview {
    let middleСarouselItems: [MiddleCarousel] = [
        MiddleCarousel(image: "chickenBiryani", eat: "Chicken Biryani", place: "Ambrosia Hotel & Restaurant"),
        MiddleCarousel(image: "sauceTonkatsu", eat: "Sauce Tonkatsu ", place: "Handi Restaurant, Chittagong"),
        MiddleCarousel(image: "chickenKatsu", eat: "Chicken Katsu", place: "Ambrosia Hotel & Restaurant"),
        MiddleCarousel(image: "dumpling", eat: "Dumpling", place: "Ambrosia Hotel & Restaurant")
    ]
    ZStack {
        Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
            .ignoresSafeArea()
        VStack {
            MiddleCaruselItem(item: middleСarouselItems[0]) {
                print("open eat")
            }
            MiddleCaruselItem(item: middleСarouselItems[1]) {
                print("open eat")
            }
            MiddleCaruselItem(item: middleСarouselItems[2]) {
                print("open eat")
            }
            MiddleCaruselItem(item: middleСarouselItems[3]) {
                print("open eat")
            }
        }
    }
}
