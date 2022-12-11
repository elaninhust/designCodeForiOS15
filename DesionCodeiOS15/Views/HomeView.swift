//
//  HomeView.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/10.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Spacer()
            
      Image("Logo 2")
        .resizable(resizingMode: .stretch)
        .aspectRatio(contentMode: .fit)
        .frame(width: 26, height: 26)
        .cornerRadius(20)
        .padding(9)
//                .background(.ultraThickMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous).fill(.ultraThinMaterial))
        .strokeStyle(cornerRadius: 20)
//                .background(
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(.white.opacity(0.6))
//                )
            
      Text("SwiftUI for iOS 15")
        .font(.largeTitle.weight(.bold))
        .lineLimit(1)
        .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            
      Text("20 sections - 3 hours".uppercased())
        .font(.footnote.weight(.semibold))
        .lineLimit(1)
        .foregroundStyle(.secondary)
            
      Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.secondary)
    }
    .padding(20)
    .frame(height: 350)
    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
    .shadow(color: Color("Shadow").opacity(0.4), radius: 10, x: 0, y: 10)
    .strokeStyle(cornerRadius: 30)
    .padding(.horizontal, 20)
    .background(
      Image("Blob 1")
        .offset(x: 250, y: -100)
    )
    .overlay(
      Image("Illustration 5")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 230)
        .offset(x: 32, y: -80)
    )
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
