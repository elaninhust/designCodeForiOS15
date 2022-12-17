//
//  NavigationBar.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/11.
//

import SwiftUI

struct NavigationBar: View {
  var title = ""
  @Binding var hasScrolled: Bool
  
  var body: some View {
    ZStack(alignment: .leading) {
      Color.clear
        .background(.ultraThinMaterial)
        .blur(radius: 20)
        .opacity(hasScrolled ? 1 : 0)
        
      HStack {
        Text(title)
          .font(.largeTitle.bold())
          //          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.leading, 20)
        
        Spacer()
          
        HStack(spacing: 16) {
          Image(systemName: "magnifyingglass")
            .font(.body.bold())
            .frame(width: 36, height: 36)
            .foregroundColor(.secondary)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
            .strokeStyle(cornerRadius: 16)
            
          Image("Avatar 1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 26, height: 26)
            .cornerRadius(10)
            .frame(width: 44, height: 44)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
            .strokeStyle(cornerRadius: 20)
        }
        .padding(.trailing, 20)
      }
    }
    .frame(height: 70)
    .frame(maxHeight: .infinity, alignment: .top)
  }
}

struct NavigationBar_Previews: PreviewProvider {
  static var previews: some View {
    NavigationBar(title: "Featured", hasScrolled: .constant(false))
  }
}
