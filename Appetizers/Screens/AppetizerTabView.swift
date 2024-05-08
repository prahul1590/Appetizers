//
//  ContentView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order:Order

    var body: some View {
        TabView{
            AppetizersListView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "bag")
                }
                .badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
