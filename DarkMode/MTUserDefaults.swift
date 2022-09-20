//
//  MTUserDefaults.swift
//  DarkMode
//
//  Created by Vladimir Sekerko on 20.09.2022.
//

import Foundation

struct MTUserDefaults {
    
    static var share = MTUserDefaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .device
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
