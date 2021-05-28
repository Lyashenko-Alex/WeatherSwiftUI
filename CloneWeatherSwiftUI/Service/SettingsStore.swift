//
//  SettingsStore.swift
//  CloneWeatherSwiftUI
//
//  Created by RX on 3/12/21.
//

import Foundation
import Combine

class SettingsStore: ObservableObject {
    
    let willChange = PassthroughSubject<Void, Never>()
    
    var city: String = UserDefaults.city {
        willSet {
            UserDefaults.city = newValue
            willChange.send()
        }
    }
    
}

extension UserDefaults {

    private struct Keys {
        static let city = "City"
    }

    static var city: String {
        get {
            return UserDefaults.standard.string(forKey: Keys.city) ?? "San Paulo"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.city)
        }
    }
}
