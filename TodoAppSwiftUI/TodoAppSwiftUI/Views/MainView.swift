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
      accountView
    } else {
      LoginView()
    }
  }
  
  @ViewBuilder
  var accountView: some View {
    TabView {
      ToDoListView(userID: UserDefaultsService.shared.userID)
        .tabItem {
          Label("Home", systemImage: "house")
        }
      
      ProfileView()
        .tabItem {
          Label("Profile", systemImage: "person.circle")
        }
    }
  }
}

//struct MainView_Previews: PreviewProvider {
//  static var previews: some View {
//    MainView()
//  }
//}
