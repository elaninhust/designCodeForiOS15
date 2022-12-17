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
      switch currentTab {
        case .Home:
          HomeView()
        case .Explore:
          AccountView()
        case .Notifications:
          ShareLink(item: URL(string: "https://apps.apple.com/cn/app/%E5%B0%8F%E8%93%9D%E9%B8%9F-bluebird-%E4%B8%93%E6%B3%A8%E7%95%AA%E8%8C%84%E9%92%9F-%E5%BE%85%E5%8A%9E%E6%B8%85%E5%8D%95/id1478757472")!) {
            Label("Share", image: "MyCustomShareIcon")
          }
        case .Library:
          Text("Library")
      }
      TabBar()
    }
    .safeAreaInset(edge: VerticalEdge.bottom) {
      Color.clear.opacity(0.4).frame(height: 44) // 这里的44是不包含indicator的高度，精确的数字 = TabBar的高度 - indicator的高度
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
