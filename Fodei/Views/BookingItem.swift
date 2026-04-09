//
//  BookingItem.swift
//  Fodei
//
//  Created by Danil on 27.03.2026.
//

import SwiftUI

enum BookingItemStyle {
    case booking
    case history
}

struct BookingItem: View {
    let item: BookingItemModel
    let style: BookingItemStyle
    var onPress: () -> ()
    
    var body: some View {
        HStack(spacing: 0) {
            Image(item.image)
                .resizable()
                .cornerRadius(8)
                .frame(width: 64, height: 64)
            VStack(alignment: .leading, spacing: 0) {
                Text(item.restaurant)
                    .font(.interSemiBold(size: 16))
                    .padding(.leading, 1)
                    .frame(height: 19)
                HStack(spacing: 0) {
                    Image("map")
                    Text(item.place)
                        .font(.interRegular(size: 10))
                        .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
                        .padding(.leading, 4)
                        .frame(width: 117, alignment: .leading)
                    GeneralButton(
                        text: style == .booking ? "Book" : "Check",
                        style: .greenState, height: 28) {
                            onPress()
                        }
                        .frame(width: 88)
                        .padding(.top, 3)
                        .padding(.leading, 12)
                }
                .padding(.top, 6)
            }
            .padding(.leading, 15)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.06), radius: 4, x: 0, y: 1)
    }
}

#Preview {
    ZStack {
        Color(#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1))
            .ignoresSafeArea()
        let bookingItems: [BookingItemModel] = [
            BookingItemModel(image: "rest1", restaurant: "Ambrosia Hotel & Restaurant", place: "kazi Deiry, Taiger Pass\nChittagong"),
            BookingItemModel(image: "rest2", restaurant: "Tava Restaurant", place: "Zakir Hossain Rd,\nChittagong"),
            BookingItemModel(image: "rest3", restaurant: "Haatkhola", place: "6 Surson Road,\nChittagong")
        ]
        BookingItem(item: bookingItems[2], style: .history) {
            print("tap")
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        print(geo.size)
                    }
            }
        )
    }
}

/*
 VStack(alignment: .leading, spacing: 0) {
 Text(item.restaurant)
 .font(.interSemiBold(size: 16))
 .padding(.top, 8)
 HStack(spacing: 0) {
 Image("map")
 Text(item.place)
 .font(.interRegular(size: 10))
 .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
 .padding(.leading, 4)
 .frame(height: 24)
 }
 
 }
 .padding([.trailing, .top, .bottom], 12)
 .padding(.leading, 15)
 
 
 
 //                    HStack(spacing: 0) {
 //                        Image("map")
 //                        Text(item.place)
 //                            .font(.interRegular(size: 10))
 //                            .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
 //                            //.frame(height: 24)
 //                            .padding(.leading, 4)
 //                            .padding(.trailing, 12)
 //                        GeneralButton(
 //                            text: "Book",
 //                            style: .greenState, height: 28) {
 //                                onPress()
 //                        }
 //                            .frame(width: 88)
 //
 //                        Spacer()
 //                    }
 */
