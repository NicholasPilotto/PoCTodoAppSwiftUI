//
//  MainViewViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation
import RealmSwift

class MainViewModel: ObservableObject {
  @Published var appDataModel = AppDataModel()
  
  public var isSignedIn: Bool {
    let user = RealmService.shared.fetch(object: User.self)
      .where {
        $0._id.equals(appDataModel.userID)
      }
    
    if !user.isEmpty {
      return true
    }
    
    return false
  }
  
  public func print() {
    Swift.print(RealmService.shared.fetch(object: User.self))
  }
  
  public init() {  }
  
}
