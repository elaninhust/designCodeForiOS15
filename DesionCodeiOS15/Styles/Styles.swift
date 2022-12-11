//
//  Styles.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/9.
//

import SwiftUI

struct StrokeStyle: ViewModifier {
  @Environment(\.colorScheme) var colorScheme
  var cornerRadius: CGFloat

  func body(content: Content) -> some View {
    content.overlay(
      RoundedRectangle(cornerRadius: cornerRadius)
        .stroke(.linearGradient(colors: [.white.opacity(0.3), .black.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
        .blendMode(.overlay)
    )
  }
}

extension View {
  func strokeStyle(cornerRadius: CGFloat) -> some View {
    modifier(StrokeStyle(cornerRadius: cornerRadius))
  }
}
