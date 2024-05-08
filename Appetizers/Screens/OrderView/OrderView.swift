//
//  OrderView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct OrderView: View {
    
    
    @EnvironmentObject var order:Order
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List(content: {
                        ForEach(order.items) { item in
                            AppetizerListCell(appetizer: item)
                        }
                        .onDelete(perform: order.deleteItems)
                    })
                    .listStyle(PlainListStyle())
                    
                    Button(){
                        print("Tapped")
                    } label: {
                        APButton(title:"$\(order.totalPrice, specifier: "%.2f") - Add to order")
                    }
                    .padding(.bottom,30)
                }
                
                if (order.items.isEmpty){
                    EmptyStateView(imageName: "empty-order",
                                   message: "You have no items in your order. \nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
    
    
}

//#Preview {
//    OrderView()
//}
