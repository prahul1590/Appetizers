//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
