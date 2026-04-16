//
//  OnBoardingViewModel.swift
//  Fodei
//
//  Created by Danil on 12.03.2026.
//

import SwiftUI
import Combine

@Observable final class OnBoardingViewModel {
    
    var page: Int? = 0
    var onNext: (() -> Void)?
    
    let items: [OnBoardingModel] = [
        OnBoardingModel(
            image: "TrackingMaps",
            title: "Nearby restaurants",
            subtitle: "You don't have to go far to find a good restaurant,\nhave provided all the restaurants that is\nnear you",
            offset: 79.24
        ),
        OnBoardingModel(
            image: "Orderillustration",
            title: "Select the Favorites Menu",
            subtitle: "Now eat well, don't leave the house,You can\nchoose your favorite food only with\none click",
            offset: 16.16
        ),
        OnBoardingModel(
            image: "SafeFood",
            title: "Good food at a cheap price",
            subtitle: "You can eat at expensive restaurants with\naffordable price",
            offset: 70.48
        )
    ]
    
    var isLastPage: Bool {
        page == items.count - 1
    }
    
    func nextPage() {
        guard let page else { return }
        if page < items.count - 1 {
            self.page = page + 1
        } else {
            finishOnboarding()
        }
    }
    
    func skip() {
        finishOnboarding()
    }
    
    private func finishOnboarding() {
        print("next view")
        onNext?()
    }
}
