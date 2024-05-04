//
//  ApptizersListView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AppetizersListView: View {
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizerListCell(appetizer: appetizer)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear(perform: {
                viewModel.getAppetizers()
            })
            
            if viewModel.isLoading{
                SpinnerView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
    
    
}



#Preview {
    AppetizersListView()
}
