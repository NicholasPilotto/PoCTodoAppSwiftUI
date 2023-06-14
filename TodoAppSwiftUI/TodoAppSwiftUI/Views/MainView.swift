//
//  ContentView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 13/06/23.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    NavigationView {
      LoginView()
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
