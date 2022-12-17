//
//  CourseItem.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/16.
//

import SwiftUI

struct CourseItem: View {
  var namespace: Namespace.ID
  
  var body: some View {
    ZStack {
      Color.clear
        .background(
          Image("Illustration 1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .matchedGeometryEffect(id: "image", in: namespace)
            .frame(height: 217)
            .offset(y: -40)
        )

      VStack(alignment: .leading, spacing: 9) {
        Text("Flutter for designers")
          .font(.title.bold())
          .matchedGeometryEffect(id: "title", in: namespace)

        Text("20 sections - 3 hours".uppercased())
          .font(.footnote.weight(.semibold))
          .foregroundStyle(.secondary)
          .matchedGeometryEffect(id: "subtitle", in: namespace)

        Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
          .font(.caption2)
          .lineLimit(2)
          .frame(maxWidth: .infinity, alignment: .leading)
          .matchedGeometryEffect(id: "text", in: namespace)
      }
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 30)
          .fill(.ultraThinMaterial)
          .matchedGeometryEffect(id: "container", in: namespace)
          .blur(radius: 20)
      )
      .frame(maxHeight: .infinity, alignment: .bottom)
    }
    .foregroundColor(.white)
    .background(
      Image("Background 1")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .matchedGeometryEffect(id: "background", in: namespace)
    )
    .frame(height: 350)
    .mask {
      RoundedRectangle(cornerRadius: 30, style: .continuous)
        .matchedGeometryEffect(id: "mask", in: namespace)
    }
    .padding()
  }
}

struct CourseItem_Previews: PreviewProvider {
  @Namespace static var namespace
  
  static var previews: some View {
    CourseItem(namespace: namespace)
  }
}
