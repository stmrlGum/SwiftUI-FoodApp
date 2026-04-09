//
//  BookingViewModel.swift
//  Fodei
//
//  Created by Danil on 07.04.2026.
//

import Foundation
import Combine

@Observable final class BookingViewModel {
    
    let bookingItems: [BookingItemModel] = [
        BookingItemModel(image: "rest1", restaurant: "Ambrosia Hotel & Restaurant", place: "kazi Deiry, Taiger Pass Chittagong"),
        BookingItemModel(image: "rest2", restaurant: "Tava Restaurant", place: "Zakir Hossain Rd, Chittagong"),
        BookingItemModel(image: "rest3", restaurant: "Haatkhola", place: "6 Surson Road, Chittagong")
    ]
    
    var isShowBookingDetail = false
    var bookingItem: BookingItemModel? = nil
    
    func bookMore() {
        print("book more")
    }
}
