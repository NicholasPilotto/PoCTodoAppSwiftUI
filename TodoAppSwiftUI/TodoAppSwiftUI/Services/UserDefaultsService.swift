//
//  UserDefaultsService.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 20/06/23.
//

import Foundation

class UserDefaultsService {
  static let USER_ID = "com.user-id"
  private let defaults = UserDefaults.standard
  
  static let shared = UserDefaultsService()
  
  public var userID: String {
    get {
      let result = defaults.string(forKey: UserDefaultsService.USER_ID)
      guard let result = result else {
        return ""
      }
      return result
    }
    
    set {
      defaults.set(newValue, forKey: UserDefaultsService.USER_ID)
    }
  }
  
  private init() {}
}
