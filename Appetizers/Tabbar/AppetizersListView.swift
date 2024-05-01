//
//  ApptizersListView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AppetizersListView: View {
    var body: some View {
        NavigationView{
            List(MockData.appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("🍟 Appetizers")
        }
    }
}

#Preview {
    AppetizersListView()
}
