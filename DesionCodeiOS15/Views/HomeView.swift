//
//  HomeView.swift
//  DesionCodeiOS15
//
//  Created by Elan on 2022/12/10.
//

import SwiftUI

struct HomeView: View {
  @State var hasScrolled = false
  @State var show = false
  @Namespace var namepsace

  var body: some View {
    ZStack {
      Color("Background")
        .ignoresSafeArea()

      ScrollView {
        VStack(spacing: 0) {
          scrollDetection

          feature

          Text("course".uppercased())
            .font(.title.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)

          if !show {
            CourseItem(namespace: namepsace)
              .onTapGesture {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                  show.toggle()
                }
              }
          }
        }
      }
      .coordinateSpace(name: "scrollView")
      // safeAreaInset必须放在下一个NavigationBar的前面，不然NavigationBar位置就会显示异常
      .safeAreaInset(edge: .top) {
        Color.clear
          .frame(height: 70) // 这里的70是不包含StatusBar的高度
      }
      .overlay {
        NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
      }

      if show {
        CourseView(namespace: namepsace, show: $show)
          .zIndex(1)
          .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.1)), removal: .opacity.animation(.easeInOut(duration: 0.3).delay(0.2))))
      }
    }
  }

  var scrollDetection: some View {
    GeometryReader { proxy in
      Color.clear
        .preference(key: ScrollPreferenceKey.self, value: proxy.frame(in: .named("scrollView")).minY)
    }
    .frame(height: 0)
    .onPreferenceChange(ScrollPreferenceKey.self, perform: { value in
      withAnimation(.easeInOut) {
        if value < 0 {
          hasScrolled = true
        } else {
          hasScrolled = false
        }
      }
    })
  }

  var feature: some View {
    TabView {
      ForEach(courses) { item in
        GeometryReader { proxy in
          let minX = proxy.frame(in: .global).minX

          FeatureItem(course: item)
            .padding(.vertical, 20)
            .rotation3DEffect(.degrees(minX / -10), axis: (x: 0, y: 1, z: 0))
            .shadow(color: Color("Shadow").opacity(0.4), radius: 10, x: 0, y: 10)
            .overlay(
              Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 230)
                .offset(x: 32, y: -80)
                .offset(x: minX)
            )
            .blur(radius: abs(minX / 10))
        }
      }
    }
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    .frame(height: 430)
    .background(
      Image("Blob 1")
        .offset(x: 250, y: -100)
    )
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
