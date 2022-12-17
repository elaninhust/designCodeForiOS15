//
//  AccountView.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/9.
//

import SwiftUI

struct AccountView: View {
  var body: some View {
    NavigationView {
      List {
        profile
                
        menu
                
        links
        
//        ShareLink(
//          link: URL(string: "https://www.apple.com")!,
//          text: "Check out this link!",
//          image: UIImage(named: "my-image")
//        )
      }
    }
  }
    
  var profile: some View {
    VStack {
      Image(systemName: "person.crop.circle.badge.checkmark")
        .symbolVariant(.circle.fill)
        .font(.system(size: 32))
        .symbolRenderingMode(.palette)
        .foregroundStyle(.blue, .blue.opacity(0.3))
        .padding()
        .background(Circle().fill(.ultraThinMaterial))
        .background(
          HexagonView()
            .symbolVariant(.fill)
            .foregroundColor(.blue)
            .font(.system(size: 200))
            .offset(x: -70, y: -100)
        )
        .background(
          BlobView()
            .offset(x: 130, y: -150)
        )
            
      Text("Meng To")
        .font(.title.weight(.semibold))
        .foregroundColor(.primary)
            
      HStack {
        Image(systemName: "location")
          .imageScale(.small)
          .foregroundColor(.secondary)
        Text("China")
          .foregroundColor(.secondary)
      }
    }
    .frame(maxWidth: .infinity)
    .swipeActions {
      Button {
        print("Login")
      } label: {
        //                        Label("Login", systemImage: "dumbbell.fill")
        Image(systemName: "dumbbell.fill")
      }
      .tint(.blue)
    }
  }
    
  var menu: some View {
    Section {
      NavigationLink(destination: ContentView()) {
        Label("Setting", systemImage: "gear")
      }
      NavigationLink(destination: {
        Text("Billing")
      }) {
        Label("Billing", systemImage: "creditcard")
      }
      NavigationLink(destination: {
        Text("Help")
      }) {
        Label("Help", systemImage: "questionmark")
      }
    }
    .listRowSeparator(.hidden)
    .foregroundColor(.primary)
  }
    
  var links: some View {
    Section {
      Link(destination: URL(string: "https://apps.apple.com/cn/app/%E5%B0%8F%E8%93%9D%E9%B8%9F-bluebird-%E4%B8%93%E6%B3%A8%E7%95%AA%E8%8C%84%E9%92%9F-%E5%BE%85%E5%8A%9E%E6%B8%85%E5%8D%95/id1478757472")!) {
        HStack {
          Label("Apple", systemImage: "apple.logo")
          Spacer()
          Image(systemName: "link")
            .foregroundStyle(.secondary)
        }
      }
      .foregroundColor(.primary)
      .swipeActions(edge: .leading, allowsFullSwipe: true) {
        Button {
          print("111")
        } label: {
          Label("Delete", systemImage: "trash")
        }
                
        Button {
          print("222")
        } label: {
          Label {
            Text("Favourt")
          } icon: {
            Image(systemName: "star.fill")
          }
        }
        .tint(.red)
      }
    }
    .listStyle(.automatic)
    .navigationTitle("Account")
  }
}

struct AccountView_Previews: PreviewProvider {
  static var previews: some View {
    AccountView()
  }
}
