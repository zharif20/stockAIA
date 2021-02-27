//
//  Storage.swift
//  AIAStock
//
//  Created by Zharif Hadi  on 28/02/2021.
//

import Foundation

public enum StorageKey: String {
    case interval
    case outputSize
}

public class Storage {
    
    public static func saveItem(value: String, key: StorageKey) {
        let prefs = UserDefaults.standard
        prefs.setValue(value, forKey: key.rawValue)
        prefs.synchronize()
    }
    
    public static func loadItem(key: StorageKey) -> String {
        let prefs = UserDefaults.standard

        if let value = prefs.string(forKey: key.rawValue) {
            return value
        }
        return "Undefined"
    }
}
