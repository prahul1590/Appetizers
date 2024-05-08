//
//  AccountView.swift
//  Appetizers
//
//  Created by Rahul Patel on 2024-05-01.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusTextField:FormTextField?
    
    enum FormTextField{
     case firstName,lastName,email
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField, equals: .firstName)
                        .onSubmit {
                            focusTextField = .lastName
                        }
                        .submitLabel(.next)
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField, equals: .lastName)
                        .onSubmit {
                            focusTextField = .email
                        }
                        .submitLabel(.next)

                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField, equals: .email)
                        .onSubmit {
                            focusTextField = nil
                        }
                        .submitLabel(.continue)
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
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss"){
                        focusTextField = nil
                    }
                }
            })
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
