//
//  ProfileViewModel.swift
//  Fodei
//
//  Created by Danil on 10.04.2026.
//

import Foundation
import Combine

@Observable final class ProfileViewModel {
    
    let settingsItem: [SettingsItemModel] = [SettingsItemModel(icon: "lang", item: "Language"),
                                             SettingsItemModel(icon: "feedback", item: "Feedback"),
                                             SettingsItemModel(icon: "rateUs", item: "Rate us"),
                                             SettingsItemModel(icon: "newVer", item: "New Version")
    ]
    
}
