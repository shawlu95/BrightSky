//
//  SettingViewModel.swift
//  BrightSky
//
//  Created by main on 2023/12/11.
//

import Foundation

struct SettingViewModel {
    let options: [SettingOption]
}

enum SettingOption {
    case upgrade
    case privacyPolicy
    case terms
    case contact
    case getHelp
    case rateApp
    
    var title: String {
        switch self {
            case .upgrade:
                return "Upgrade to Premium"
            case .privacyPolicy:
                return "Privacy Policy"
            case .terms:
                return "Terms of Service"
            case .contact:
                return "Contact Us"
            case .getHelp:
                return "Get Help"
            case .rateApp:
                return "Rate App!"
        }
    }
}
