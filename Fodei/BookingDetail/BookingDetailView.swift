//
//  BookingDetailView.swift
//  Fodei
//
//  Created by Danil on 08.04.2026.
//

import SwiftUI

struct BookingDetailView: View {
    
    @State var viewModel: BookingDetailViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            bookingDetailHeader
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    VStack(spacing: 15) {
                        restaurantDetails
                        listOtherRestaurant
                    }
                    .padding(.top, 8)
                }
                .scrollIndicators(.hidden)
            }
            bookingDetailFooter
        }
        .background(Color(#colorLiteral(red: 0.9719, green: 0.9719, blue: 0.9719, alpha: 1)))
    }
}

private extension BookingDetailView {
    var bookingDetailHeader: some View {
        GeometryReader { proxy in
            let topInset = proxy.safeAreaInsets.top
            let totalHeight = 54 + topInset
            ZStack(alignment: .bottom) {
                UnevenRoundedRectangle(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 20,
                    bottomTrailingRadius: 20,
                    topTrailingRadius: 0
                )
                .fill(Color(#colorLiteral(red: 0.2216, green: 0.7543, blue: 0.4831, alpha: 1)))
                .frame(height: totalHeight)
                .padding(.top, -topInset)
                HStack(alignment: .center, spacing: 0) {
                    Button {
                        dismiss()
                    } label: {
                        Image("backButtonWhite")
                    }
                    Spacer()
                    Text("Details Restaurant")
                        .font(.interSemiBold(size: 12))
                        .foregroundColor(.white)
                        .frame(height: 54)
                        .padding(.leading, -24)
                    Spacer()
                }
                .padding(.horizontal, 12)
            }
        }
        .frame(height: 54)
    }
}

private extension BookingDetailView {
    var restaurantDetails: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.bookingItem?.restaurant ?? "-")
                        .foregroundStyle(Color(#colorLiteral(red: 0.1608, green: 0.2145, blue: 0.2791, alpha: 1)))
                        .font(.interSemiBold(size: 20))
                    HStack(spacing: 4) {
                        Image("map")
                        Text(viewModel.bookingItem?.place ?? "-")
                            .font(.interMedium(size: 12))
                            .foregroundStyle(Color(#colorLiteral(red: 0.4944067001, green: 0.523111999, blue: 0.5743489861, alpha: 1)))
                    }
                }
                Image(viewModel.bookingItem?.image ?? "mockPlace")
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(16/9, contentMode: .fill)
                    .frame(height: 180)
                    .clipped()
                    .cornerRadius(8)
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack(spacing: 4) {
                            Image("clock")
                            Text("Open today")
                                .font(.interMedium(size: 12))
                                .foregroundStyle(Color(#colorLiteral(red: 0.4944067001, green: 0.523111999, blue: 0.5743489861, alpha: 1)))
                        }
                        Text("10:00 AM - 12:00 PM")
                            .font(.interSemiBold(size: 12))
                    }
                    Spacer()
                    Button {
                        viewModel.goToPlace()
                    } label: {
                        HStack(spacing: 7) {
                            Image("directionsIcon")
                            Text("Visit the Restaurant")
                                .font(.interSemiBold(size: 12))
                                .foregroundStyle(Color(#colorLiteral(red: 0.207667917, green: 0.6340327859, blue: 1, alpha: 1)))
                        }
                    }
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 18)
            .padding(.top, 20)
            .padding(.bottom, 28)
            .background(Color.white)
            .cornerRadius(16)
        }
    }
}

private extension BookingDetailView {
    var listOtherRestaurant: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("List other restaurant")
                        .foregroundStyle(Color(#colorLiteral(red: 0.1608, green: 0.2145, blue: 0.2791, alpha: 1)))
                        .font(.interSemiBold(size: 16))
                    Text("check the menu at this restaurant")
                        .foregroundStyle(Color(#colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.5019607843, alpha: 1)))
                        .font(.interRegular(size: 10))
                }
                Spacer()
                Button {
                    viewModel.seeAll()
                } label: {
                    HStack(spacing: 8) {
                        Text("See All")
                            .font(.interSemiBold(size: 12))
                            .foregroundStyle(Color(#colorLiteral(red: 0.1960784314, green: 0.7176470588, blue: 0.4078431373, alpha: 1)))
                        Image("greenArrow")
                    }
                }
            }
            VStack(spacing: 6) {
                ForEach(Array(viewModel.bookingItems.enumerated()), id: \.element.id) { _ , item in
                    BookingItem(item: item, style: .booking) {
                        viewModel.makeBookingFromPlace(place: item.restaurant)
                    }
                }
            }
            .scrollTargetLayout()
            .padding(.top, 21)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 22)
        .padding(.top, 20)
        .padding(.bottom, 28)
        .background(Color.white)
        .cornerRadius(16)
    }
}

private extension BookingDetailView {
    var bookingDetailFooter: some View {
        GeometryReader { proxy in
            let bottomInset = proxy.safeAreaInsets.bottom
            let totalHeight = 85 + bottomInset
            ZStack(alignment: .top) {
                UnevenRoundedRectangle(
                    topLeadingRadius: 20,
                    bottomLeadingRadius: 0,
                    bottomTrailingRadius: 0,
                    topTrailingRadius: 20
                )
                .fill(.white)
                .frame(height: totalHeight)
                .frame(maxWidth: .infinity, alignment: .top)
                .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0, y: 4)
                HStack {
                    GeneralButton(text: "Booking", style: .greenState, height: 33) {
                        viewModel.makeBooking()
                    }
                    .cornerRadius(10)
                }
                .padding(.top, 26)
                .padding(.horizontal, 71)
            }
            .frame(width: proxy.size.width, height: totalHeight, alignment: .top)
        }
        .frame(height: 85)
        .fixedSize(horizontal: false, vertical: true)
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    let bookingItems: [BookingItemModel] = [
        BookingItemModel(image: "rest1", restaurant: "Ambrosia Hotel & Restaurant", place: "kazi Deiry, Taiger Pass Chittagong"),
        BookingItemModel(image: "rest2", restaurant: "Tava Restaurant", place: "Zakir Hossain Rd, Chittagong"),
        BookingItemModel(image: "rest3", restaurant: "Haatkhola", place: "6 Surson Road, Chittagong")
    ]
    
    ScreenFactory.makeBookingDetail(bookingItem: bookingItems[0])
}
