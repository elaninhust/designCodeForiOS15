//
//  matchedView.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/16.
//

import SwiftUI

struct matchedView: View {
  @Namespace var namespace
  @State var show = false

  var body: some View {
    ZStack {
      if !show {
        VStack(alignment: .leading, spacing: 8) {
          Text("Hello, World!")
            .font(.title.bold())
            .matchedGeometryEffect(id: "text", in: namespace)
            .frame(maxWidth: .infinity, alignment: .leading)

          Text("subtitle")
            .matchedGeometryEffect(id: "subtitle", in: namespace)
            .font(.body)
            .foregroundStyle(.secondary)
        }
        .padding()
        .foregroundColor(.white)
        .background(
          Color.teal
            .matchedGeometryEffect(id: "background", in: namespace)
        )
        .padding()
      } else {
        VStack() {
          Spacer()

          Text("Hello, World!")
            .font(.title.bold())
            .matchedGeometryEffect(id: "text", in: namespace)
            .frame(maxWidth: .infinity)

          Text("subtitle")
            .matchedGeometryEffect(id: "subtitle", in: namespace)
            .font(.body)
            .foregroundStyle(.secondary)
        }
        .padding(.vertical, 20)
        .background(
          Color.blue
            .matchedGeometryEffect(id: "background", in: namespace)
        )
        .foregroundColor(.yellow)
      }
    }
    .onTapGesture {
      withAnimation {
        show.toggle()
      }
    }
  }
}

struct matchedView_Previews: PreviewProvider {
  static var previews: some View {
    matchedView()
  }
}
