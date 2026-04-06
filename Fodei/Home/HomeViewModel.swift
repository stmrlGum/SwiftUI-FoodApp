//
//  HomeViewModel.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import Foundation
import Combine

@Observable final class HomeViewModel {
    
    var searchText = ""
    var currentPage: Int? = 0
    let id = UUID()
    
    let topСarouselItems: [TopСarousel] = [
        TopСarousel(image: "burgers",
                    title: "Flash Offer",
                    subtitle: "We are here with the best\ndeserts intown."),
        TopСarousel(image: "pizzas",
                    title: "New Arivable",
                    subtitle: "We are here with the best\ndeserts intown."),
        TopСarousel(image: "burgers",
                    title: "Flash Offer",
                    subtitle: "We are here with the best\ndeserts intown."),
    ]
    
    let middleСarouselItems: [MiddleCarousel] = [
        MiddleCarousel(image: "chickenBiryani", eat: "Chicken Biryani", place: "Ambrosia Hotel & Restaurant"),
        MiddleCarousel(image: "sauceTonkatsu", eat: "Sauce Tonkatsu ", place: "Handi Restaurant, Chittagong"),
        MiddleCarousel(image: "chickenKatsu", eat: "Chicken Katsu", place: "Ambrosia Hotel & Restaurant"),
        MiddleCarousel(image: "dumpling", eat: "Dumpling", place: "Ambrosia Hotel & Restaurant")
    ]
    
    let bookingItems: [BookingItemModel] = [
        BookingItemModel(image: "rest1", restaurant: "Ambrosia Hotel & Restaurant", place: "kazi Deiry, Taiger Pass Chittagong"),
        BookingItemModel(image: "rest2", restaurant: "Tava Restaurant", place: "Zakir Hossain Rd, Chittagong"),
        BookingItemModel(image: "rest3", restaurant: "Haatkhola", place: "6 Surson Road, Chittagong")
    ]
    
    
}
