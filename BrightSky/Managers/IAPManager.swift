//
//  IAPManager.swift
//  in-app purchase manager
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import RevenueCat
import Foundation

final class IAPManager {
    static let shared = IAPManager()
    
    private init() {}
    
    func isSubscribed(completion: @escaping (Bool) -> Void) {
        Purchases.shared.getCustomerInfo { info, error in
            guard let subscriptions = info?.activeSubscriptions else { return }
            print(subscriptions)
            if subscriptions.isEmpty {
                print("Not suscribed")
            } else {
                print("Subscribed")
            }
            completion(!subscriptions.isEmpty)
        }
    }
}
