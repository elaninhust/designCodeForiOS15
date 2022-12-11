//
//  MainView.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/11.
//

import SwiftUI

struct MainView: View {
  @AppStorage("currentTab") var currentTab: TabEnum = .Home
  
    var body: some View {
      ZStack {
        VStack(spacing: 0) {
          switch currentTab {
            case .Home:
              HomeView()
            case .Explore:
              AccountView()
            case .Notifications:
              Text("Notifications")
            case .Library:
              Text("Library")
          }
        }
        TabBar()
      }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
