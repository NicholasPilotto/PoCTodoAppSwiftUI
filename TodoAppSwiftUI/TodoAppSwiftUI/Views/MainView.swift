//
//  ContentView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 13/06/23.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel = MainViewModel()
  
  var body: some View {
    if viewModel.isSignedIn {
      ToDoListItemsView()
    } else {
      LoginView()
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
