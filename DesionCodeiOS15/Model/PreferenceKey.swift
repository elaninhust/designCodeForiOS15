//
//  PreferenceKey.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/16.
//

import SwiftUI

struct ScrollPreferenceKey: PreferenceKey {
  static var defaultValue: Double = 0
  
  static func reduce(value: inout Double, nextValue: () -> Double) {
    value = nextValue()
  }
}
