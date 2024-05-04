//
//  ContentView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
           AppetizersListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                 .tabItem {
                     Image(systemName: "person")
                     Text("Account")
                 }
            OrderView()
                 .tabItem {
                     Image(systemName: "bag")
                     Text("Order")
                 }
        }
        .tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}
