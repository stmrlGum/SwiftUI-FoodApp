//
//  BookingViewModel.swift
//  Fodei
//
//  Created by Danil on 09.04.2026.
//

import Foundation
import Combine

@Observable final class BookingDetailViewModel {
    
    var bookingItem: BookingItemModel?
    
    let bookingItems: [BookingItemModel] = [
        BookingItemModel(image: "rest1", restaurant: "Ambrosia Hotel & Restaurant", place: "kazi Deiry, Taiger Pass Chittagong"),
        BookingItemModel(image: "rest2", restaurant: "Tava Restaurant", place: "Zakir Hossain Rd, Chittagong"),
        BookingItemModel(image: "rest3", restaurant: "Haatkhola", place: "6 Surson Road, Chittagong")
    ]
    
    init(bookingItem: BookingItemModel?) {
        self.bookingItem = bookingItem
    }
    
    func makeBooking() {
        print("booked vm")
    }
    
    func makeBookingFromPlace(place: String) {
        print("booked place \(place)")
    }
    
    func goToPlace() {
        print("go to place vm")
    }
    
    func seeAll() {
        print("see all vm")
    }
    
}
