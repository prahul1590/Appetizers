//
//  cardView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-04.
//

import SwiftUI

struct AppetizerDetailView: View {
    @EnvironmentObject var order:Order
   
    let appetizer:Appetizer
    @Binding var isShowingDetail : Bool
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            Spacer()
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing:40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                }
            }
            Spacer()
            Button(){
                order.add(appetizer)
                isShowingDetail = false
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to order")
            }
            .modifier(StandardButtonStyle())
//            .standardButtonStyle()
//            .buttonStyle(.bordered)
//            .tint(.brandPrimary)
//            .controlSize(.large)
            .padding(.bottom,30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay (Button{
            isShowingDetail = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
        
    }
}

struct NutritionInfo:View {
    
    let title:String
    let value:Int
    
    var body: some View {
        VStack(spacing:5){
            Text(title)
                .font(.caption)
                .fontWeight(.bold)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                        isShowingDetail: .constant(true))
}
