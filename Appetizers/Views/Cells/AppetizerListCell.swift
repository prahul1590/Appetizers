//
//  ApetizerListCell.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer : Appetizer
    
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 90)
                .clipShape(.rect(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 10){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                if #available(iOS 16.0, *) {
                    Text("$\(appetizer.price,specifier: "%.2f")")
                        .foregroundStyle(.secondary)
                        .fontWeight(.bold)
                } else {
                    // Fallback on earlier versions
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
