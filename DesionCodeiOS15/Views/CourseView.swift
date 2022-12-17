//
//  CourseView.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/16.
//

import SwiftUI

struct CourseView: View {
  var namespace: Namespace.ID

  @Binding var show: Bool

  var body: some View {
    ZStack {
      Color("Background")
        .ignoresSafeArea()

      ScrollView {
        ZStack {
          Color.clear
            .background(
              Image("Illustration 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image", in: namespace)
            )
        }
        .frame(height: 450)
        .background(
          Image("Background 1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .matchedGeometryEffect(id: "background", in: namespace)
        )
        .foregroundColor(.primary)
        .mask {
          RoundedRectangle(cornerRadius: 30, style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace)
        }
        .overlay {
          VStack(alignment: .leading, spacing: 12) {
            Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
              .font(.caption2)
              .lineLimit(2)
              .frame(maxWidth: .infinity, alignment: .leading)
              .matchedGeometryEffect(id: "text", in: namespace)

            Text("20 sections - 3 hours".uppercased())
              .font(.footnote.weight(.semibold))
              .foregroundStyle(.secondary)
              .matchedGeometryEffect(id: "subtitle", in: namespace)

            Text("Flutter for designers")
              .font(.title.bold())
              .matchedGeometryEffect(id: "title", in: namespace)
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 30)
          .background(
            RoundedRectangle(cornerRadius: 30)
              .fill(.ultraThinMaterial)
              .matchedGeometryEffect(id: "container", in: namespace)
          )
          .frame(maxHeight: .infinity, alignment: .bottom)
          .offset(y: 120)
          .padding(20)
        }
      }
      .ignoresSafeArea()

      Button {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
          show.toggle()
        }
      } label: {
        Image(systemName: "xmark")
          .font(.title2.bold())
          .foregroundColor(.secondary)
          .frame(width: 32, height: 32)
          .background(.ultraThinMaterial, in: Circle())
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
      .padding(20)
      .ignoresSafeArea()
    }
  }
}

struct CourseView_Previews: PreviewProvider {
  @Namespace static var namespace

  static var previews: some View {
    CourseView(namespace: namespace, show: .constant(false))
  }
}
