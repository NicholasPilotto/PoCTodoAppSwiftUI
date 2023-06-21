//
//  ProfileView.swift
//  TodoAppSwiftUI
//
//  Created by Nicholas Pilotto on 14/06/23.
//

import SwiftUI

struct ProfileView: View {
  @StateObject var viewModel = ProfileViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        
      }
      .navigationTitle("Profile")
    }
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
