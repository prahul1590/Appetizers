//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-06.
//

import SwiftUI

final class AccountViewModel:ObservableObject{
    
    @AppStorage("user") private var userData:Data?
    
    @Published var user = User()
    @Published var alertItem :AlertItem?
    
    var isValidForm : Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {return}
        do {
            let decoder = try JSONEncoder().encode(user)
            userData = decoder
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retreiveUser(){
        guard let userData = userData else { return }
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
            print(user)
        }catch{
            alertItem = AlertContext.invalidData
        }
    }
}
