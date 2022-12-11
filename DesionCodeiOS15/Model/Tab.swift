//
//  Tab.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/10.
//

import SwiftUI

struct TabItem: Identifiable {
  var id = UUID()
  var icon: String
  var title: String
  var tab: TabEnum
  var color: Color
}

var TabData = [
  TabItem(icon: "house", title: "Home", tab: TabEnum.Home, color: .teal),
  TabItem(icon: "magnifyingglass", title: "Explore", tab: TabEnum.Explore, color: .pink),
  TabItem(icon: "bell.fill", title: "Notifications", tab: TabEnum.Notifications, color: .blue),
  TabItem(icon: "rectangle.stack.badge.play.fill", title: "Library", tab: TabEnum.Library, color: .cyan),
]

enum TabEnum: String {
  case Home
  case Explore
  case Notifications
  case Library
}

struct TabPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = 0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
    value = nextValue()
  }
}
