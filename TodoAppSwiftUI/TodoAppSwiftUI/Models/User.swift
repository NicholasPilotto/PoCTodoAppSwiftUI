//
//  User.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation
import RealmSwift

class User: Object {
  @Persisted(primaryKey: true) var _id: String
  @Persisted var name: String
  @Persisted var email: String
  @Persisted var password: String
  @Persisted var joined: TimeInterval
  @Persisted var todos: List<ToDoListItem>
  
  override init() {}
  
  init(name: String, email: String, password: String) {
    super.init()
    
    self._id = UUID().uuidString
    self.name = name
    self.email = email
    self.password = password
    self.joined = Date().timeIntervalSince1970
    self.todos = List<ToDoListItem>()
  }
}
