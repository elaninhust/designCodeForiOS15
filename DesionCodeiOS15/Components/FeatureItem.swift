//
//  FeatureItem.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/11.
//

import SwiftUI

struct FeatureItem: View {
  @AppStorage("currentTab") var currentTab: TabEnum = .Home
  @State var course: Course
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Spacer()
              
      Image(course.logo)
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
              
      Text(course.title)
        .font(.largeTitle.weight(.bold))
        .lineLimit(1)
        .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
              
      Text(course.subtitle.uppercased())
        .font(.footnote.weight(.semibold))
        .lineLimit(1)
        .foregroundStyle(.secondary)
              
      Text(course.text)
        .font(.footnote)
        .multilineTextAlignment(.leading)
        .lineLimit(2)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.secondary)
    }
    .padding(20)
    .frame(height: 350)
    .background(.ultraThinMaterial)
    .mask({
      RoundedRectangle(cornerRadius: 30, style: .continuous)
    })
//    .shadow(color: Color("Shadow").opacity(0.4), radius: 10, x: 0, y: 10)
    .strokeStyle(cornerRadius: 30)
    .padding(.horizontal, 20)
//    .overlay(
//      Image(course.image)
//        .resizable()
//        .aspectRatio(contentMode: .fit)
//        .frame(height: 230)
//        .offset(x: 32, y: -80)
//    )
  }
}

struct FeatureItem_Previews: PreviewProvider {
  static var previews: some View {
    FeatureItem(course: courses[0])
  }
}
