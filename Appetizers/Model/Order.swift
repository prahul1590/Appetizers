//
//  Order.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-08.
//

import SwiftUI

final class Order:ObservableObject{
    @Published var items:[Appetizer]=[]
    
    var totalPrice:Double{
        items.reduce(0) {$0+$1.price}
    }
    
    func add(_ appetizer:Appetizer){
        items.append(appetizer)
    }
    
    func deleteItems(atOffset indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
}


