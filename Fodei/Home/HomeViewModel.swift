//
//  HomeViewModel.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import Foundation
import Combine
import CoreLocation

@Observable final class HomeViewModel {
    
    var searchText = ""
    var currentPage: Int? = 0
    var isShowMap = false
    var selectedCoordinate: CLLocationCoordinate2D?
    
    let topСarouselItems: [TopСarousel] = [
        TopСarousel(
            image: "burgers",
            title: "Flash Offer",
            subtitle: "We are here with the best\ndeserts intown.",
            position: CLLocationCoordinate2D(latitude: 43.1155, longitude: 131.8855)
        ),
        TopСarousel(
            image: "pizzas",
            title: "New Arivable",
            subtitle: "We are here with the best\ndeserts intown.",
            position: CLLocationCoordinate2D(latitude: 43.1058, longitude: 131.8735)
        ),
        TopСarousel(
            image: "burgers",
            title: "Flash Offer",
            subtitle: "We are here with the best\ndeserts intown.",
            position: CLLocationCoordinate2D(latitude: 43.1252, longitude: 131.9012)
        ),
    ]

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
    
    let bookingItems: [BookingItemModel] = [
        BookingItemModel(image: "rest1", restaurant: "Ambrosia Hotel & Restaurant", place: "kazi Deiry, Taiger Pass Chittagong"),
        BookingItemModel(image: "rest2", restaurant: "Tava Restaurant", place: "Zakir Hossain Rd, Chittagong"),
        BookingItemModel(image: "rest3", restaurant: "Haatkhola", place: "6 Surson Road, Chittagong")
    ]
    
    
}
