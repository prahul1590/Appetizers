//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-03.
//

import SwiftUI

final class AppetizerListViewModel:ObservableObject{
    @Published var appetizers = [Appetizer]()

    @Published var alertItem : AlertItem?

    func getAppetizers(){
        NetworkManager.shared.getAppetizers {[self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error{
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                    
                    print(error.localizedDescription)
                }
            }
        }
    }
}
