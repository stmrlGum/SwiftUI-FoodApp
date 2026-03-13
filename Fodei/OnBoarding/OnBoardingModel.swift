//
//  OnBoardingModel.swift
//  Fodei
//
//  Created by Danil on 12.03.2026.
//

import CoreFoundation
import Foundation

struct OnBoardingModel: Identifiable {
    let id = UUID()
    let image: String
    let title: String
    let subtitle: String
    let offset: CGFloat
}
