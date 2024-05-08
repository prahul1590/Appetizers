//
//  AccountView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()

    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                    
                } header: {
                    Text("Personal Info")
                }
                Section("Requests") {
                    Toggle("Extra Napkin", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(.brandPrimary)

            }
            .navigationTitle("🤣 Account")
        }
        .onAppear(perform: {
            viewModel.retreiveUser()
        })
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AccountView()
}
