//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-08.
//

import SwiftUI

struct StandardButtonStyle:ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}

extension View{
    func standardButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
}
