//
//  BookingView.swift
//  Fodei
//
//  Created by Danil on 07.04.2026.
//

import SwiftUI

struct BookingView: View {
    
    @State var viewModel: BookingViewModel
    var onDetailOpen: (BookingItemModel) -> Void
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                bookingHeader
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        bookingHistoryItems
                        bookingMoreButton
                            .padding(.bottom, 26)
                    }
                    .padding(.top, 24)
                }
                Spacer()
            }
        }
    }
    
    private func openBookingDetail(bookingItem: BookingItemModel) {
        viewModel.bookingItem = bookingItem
        viewModel.isShowBookingDetail = true
    }
}

private extension BookingView {
    var bookingHeader: some View {
        GeometryReader { proxy in
            let topInset = proxy.safeAreaInsets.top
            let totalHeight = 67 + topInset
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
                Text("Booking History")
                    .font(.interSemiBold(size: 16))
                    .foregroundColor(.white)
                    .frame(height: 67)
            }
        }
        .frame(height: 67)
        
    }
}

private extension BookingView {
    var bookingHistoryItems: some View {
        VStack(spacing: 6) {
            ForEach(Array(viewModel.bookingItems.enumerated()), id: \.element.id) { _ , item in
                BookingItem(item: item, style: .history) {
                    onDetailOpen(item)
                }
                
            }
        }
        .scrollTargetLayout()
        .padding(.horizontal, 5)
    }
}

private extension BookingView {
    var bookingMoreButton: some View {
        Button {
            viewModel.bookMore()
        } label: {
            HStack {
                Image("plusButton")
                Text("Booking more")
                    .font(.interMedium(size: 16))
                    .foregroundStyle(Color(#colorLiteral(red: 0.4944067001, green: 0.523111999, blue: 0.5743489861, alpha: 1)))
                
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
        }
        
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color(#colorLiteral(red: 0.1777858436, green: 0.1777858436, blue: 0.1777858436, alpha: 1)).opacity(0.06), radius: 4, x: 0, y: 1)
    }
}

#Preview {
    ScreenFactory.makeBooking { _ in
        print("kek")
    }
}
