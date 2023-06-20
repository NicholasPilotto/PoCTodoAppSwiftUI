//
//  MainViewViewModel.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation
import RealmSwift

class MainViewModel: ObservableObject {  
  public var isSignedIn: Bool {
      return !UserDefaultsService.shared.userID.isCompletelyEmpty
  }
  
  public init() {  }
  
}
