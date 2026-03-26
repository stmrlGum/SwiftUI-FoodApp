//
//  TabBarEnums.swift
//  Fodei
//
//  Created by Danil on 25.03.2026.
//

enum TabBarEnums: String, CaseIterable {
    case home
    case booking
    case profile
    
    var icon: String {
        switch self {
        case .home: return "home"
        case .booking: return "booking"
        case .profile: return "profile"
        }
    }
    
    var selectedIcon: String {
        switch self {
        case .home: return "selectedHome"
        case .booking: return "selectedBooking"
        case .profile: return "selectedProfile"
        }
    }
}
