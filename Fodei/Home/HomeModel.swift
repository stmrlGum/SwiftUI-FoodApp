//
//  ProfileModel.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import Foundation

struct TopСarousel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
}

struct MiddleCarousel: Identifiable {
    let id = UUID()
    let image: String
    let eat: String
    let place: String
    // let coord
}

struct BookingItemModel: Identifiable {
    let id = UUID()
    let image: String
    let restaurant: String
    let place: String
}
