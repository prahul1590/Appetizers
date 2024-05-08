//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-08.
//

import SwiftUI

struct EmptyStateView: View {
    var imageName:String
    var message:String
    
    
    var body: some View {
        ZStack(content: {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(.secondaryLabel))
                    .padding()
            }
            .offset(y:-50)
        })
    }
}

#Preview {
    EmptyStateView(imageName: "empty-order", message: "This is our test message. \nI'm asking it a little long for testing.")
}
