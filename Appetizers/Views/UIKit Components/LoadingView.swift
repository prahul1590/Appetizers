//
//  LoadingView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-04.
//

import SwiftUI

struct SpinnerView: View {
  var body: some View {
    ProgressView()
      .progressViewStyle(CircularProgressViewStyle(tint: .blue))
      .scaleEffect(2.0, anchor: .center) // Makes the spinner larger
      .onAppear {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//          // Simulates a delay in content loading
//          // Perform transition to the next view here
//        }
      }
  }
}
