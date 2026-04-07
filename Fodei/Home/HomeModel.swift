//
//  ProfileModel.swift
//  Fodei
//
//  Created by Danil on 26.03.2026.
//

import Foundation
import CoreLocation

struct TopСarousel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
    let position: CLLocationCoordinate2D
}

struct MiddleCarousel: Identifiable {
    let id = UUID()
    let image: String
    let eat: String
    let place: String
    let position: CLLocationCoordinate2D
}

struct BookingItemModel: Identifiable {
    let id = UUID()
    let image: String
    let restaurant: String
    let place: String
}
