//
//  TabBar.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/10.
//

import SwiftUI

struct TabBar: View {
  @AppStorage("currentTab") var currentTab: TabEnum = .Home
  @State var currentTabColor: Color = .teal
  @State var tabItemWidth: CGFloat = 0

  var body: some View {
    tabBar
  }

  var tabBar: some View {
    HStack(spacing: 0) {
      ForEach(TabData) { item in
        Button {
          withAnimation {
            currentTab = item.tab
            currentTabColor = item.color
          }
        } label: {
          VStack(spacing: 5) {
            Image(systemName: item.icon)
              .font(.title3.bold())
              .frame(width: 20, height: 20)

            Text(item.title)
              .font(.caption2)
          }
          .frame(height: 49)
          .frame(maxWidth: .infinity)
        }
        .foregroundColor(currentTab == item.tab ? item.color : .secondary)
        .overlay {
          GeometryReader { proxy in
//            Text("\(proxy.size.height)")
            Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
          }
        }
        .onPreferenceChange(TabPreferenceKey.self) { value in
          tabItemWidth = value
        }
      }
    }
    .padding(.top, 8)
    .frame(height: 88, alignment: .top)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .background(
      HStack {
        if currentTab == .Explore { Spacer() }
        if currentTab == .Notifications {
          Spacer()
          Spacer()
        }
        if currentTab == .Library { Spacer() }
        Circle().foregroundColor(currentTabColor)
          .frame(width: tabItemWidth)
        if currentTab == .Home {
          Spacer()
        }

        if currentTab == .Explore {
          Spacer()
          Spacer()
        }

        if currentTab == .Notifications { Spacer() }
      }
    )
    .overlay(
      HStack {
        if currentTab == .Explore { Spacer() }
        if currentTab == .Notifications {
          Spacer()
          Spacer()
        }
        if currentTab == .Library { Spacer() }

        RoundedRectangle(cornerRadius: 3)
          .fill(currentTabColor)
          .frame(width: 28, height: 5)
          .frame(maxHeight: .infinity, alignment: .top)
          .frame(width: tabItemWidth)

        if currentTab == .Home {
          Spacer()
        }

        if currentTab == .Explore {
          Spacer()
          Spacer()
        }

        if currentTab == .Notifications { Spacer() }
      }
    )
    .strokeStyle(cornerRadius: 30)
    .frame(maxHeight: .infinity, alignment: .bottom)
    .ignoresSafeArea()
  }
}

struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
  }
}
