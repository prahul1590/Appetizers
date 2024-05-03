//
//  ApptizersListView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AppetizersListView: View {
    @State private var appetizers = [Appetizer]()
    
    var body: some View {
        NavigationView{
            List(appetizers){ appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("🍟 Appetizers")
        }
        .onAppear(perform: {
            getAppetizers()
        })
    }
    
    func getAppetizers(){
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    AppetizersListView()
}
