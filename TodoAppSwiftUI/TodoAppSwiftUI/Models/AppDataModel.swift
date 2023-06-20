//
//  AppDataModle.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 19/06/23.
//

import Foundation
import RealmSwift

class AppDataModel: Object {
  @Persisted var userID: String = ""
  
  public override init() {}
  
  public init(userID: String) {
    self.userID = userID
  }
}
