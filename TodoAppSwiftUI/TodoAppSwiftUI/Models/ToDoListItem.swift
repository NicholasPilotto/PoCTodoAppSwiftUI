//
//  ToDoListItem.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import Foundation
import RealmSwift

class ToDoListItem: Object {
  @Persisted var id: String
  @Persisted var title: String
  @Persisted var dueData: TimeInterval
  @Persisted var createdDate: TimeInterval
  @Persisted var isDone: Bool
  
  override init() {}
  
  public init(id: String, title: String, dueData: TimeInterval, createdDate: TimeInterval, isDone: Bool) {
    super.init()
    self.id = id
    self.title = title
    self.dueData = dueData
    self.createdDate = createdDate
    self.isDone = isDone
  }
  
  public func setDone(_ state: Bool) {
    self.isDone = state
  }
}
