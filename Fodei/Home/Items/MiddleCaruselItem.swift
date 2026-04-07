//
//  MiddleCaruselItem.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import SwiftUI
import CoreLocation

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
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 1)
        .onTapGesture {
            onPress()
        }
    }
}

#Preview {
    let middleСarouselItems: [MiddleCarousel] = [
        MiddleCarousel(
            image: "chickenBiryani",
            eat: "Chicken Biryani",
            place: "Ambrosia Hotel & Restaurant",
            position: CLLocationCoordinate2D(latitude: 43.1180, longitude: 131.8820)
        ),
        MiddleCarousel(
            image: "sauceTonkatsu",
            eat: "Sauce Tonkatsu",
            place: "Handi Restaurant, Chittagong",
            position: CLLocationCoordinate2D(latitude: 43.1123, longitude: 131.8958)
        ),
        MiddleCarousel(
            image: "chickenKatsu",
            eat: "Chicken Katsu",
            place: "Ambrosia Hotel & Restaurant",
            position: CLLocationCoordinate2D(latitude: 43.1215, longitude: 131.8702)
        ),
        MiddleCarousel(
            image: "dumpling",
            eat: "Dumpling",
            place: "Ambrosia Hotel & Restaurant",
            position: CLLocationCoordinate2D(latitude: 43.1072, longitude: 131.8899)
        )
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
