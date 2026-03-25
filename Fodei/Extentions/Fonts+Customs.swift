//
//  Fonts+Customs.swift
//  Fodei
//
//  Created by Danil on 11.03.2026.
//

import SwiftUI

extension Font {
    static func interRegular(size: CGFloat) -> Font {
        return Font.custom("Inter-Regular", size: size)
    }

    static func interSemiBold(size: CGFloat) -> Font {
        return Font.custom("Inter-SemiBold", size: size)
    }
    
    static func interBold(size: CGFloat) -> Font {
        return Font.custom("Inter-Bold", size: size)
    }
    
    static func interMedium(size: CGFloat) -> Font {
        return Font.custom("Inter-Medium", size: size)
    }

    
}
