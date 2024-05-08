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
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("🍟 Appetizers")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear(perform: {
                viewModel.getAppetizers()
            })
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail{
                if let selectedAppetizer = viewModel.selectedAppetizer {
                    AppetizerDetailView(appetizer: selectedAppetizer, isShowingDetail: $viewModel.isShowingDetail)
                  }
            }
            
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
