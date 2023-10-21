//
//  ProfileView.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject private var viewModel = OnBoardingViewModel()
    
    @Environment(\.presentationMode) var presentation
    
    @State private var orderStatus = false
    @State private var passwordChanges = false
    @State private var specialOffers = false
    @State private var newsletter = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var isLoggedOut = false
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 5) {
                VStack {
                    Text("Personal Information")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.regularText())
                        .foregroundColor(.blackColor)

                    Spacer()
                    Text("Avatar")
                        .onboardingTextStyle()
                    HStack(spacing: 0) {
                        Image("user")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
                        Button("Change") { }
                            .buttonStyle(ButtonUpdateAction())
                        Button("Remove") { }
                            .buttonStyle(ButtonDiscardAction())
                        Spacer()
                    }
                }
                
                Spacer()
                
                VStack{
                    Text("First name")
                        .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                
                VStack {
                    Text("Last name")
                        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                    
                }
                
                VStack {
                    Text("E-mail")
                        .onboardingTextStyle()
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                
                VStack {
                    Text("Phone number")
                        .onboardingTextStyle()
                    TextField("Phone number", text: $phoneNumber)
                        .keyboardType(.default)
                }
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            
            Text("Email notifications")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.regularText())
                .foregroundColor(.blackColor)
                .padding()
            VStack {
                Toggle("Order statuses", isOn: $orderStatus)
                Toggle("Password changes", isOn: $passwordChanges)
                Toggle("Special offers", isOn: $specialOffers)
                Toggle("Newsletter", isOn: $newsletter)
            }
            .padding()
            .font(Font.leadText())
            .foregroundColor(.primaryColor1)
            
            Button("Log out") {
                viewModel.clearData()
                isLoggedOut = true
            }
            .buttonStyle(ButtonYellow())
            Spacer(minLength: 20)
            HStack {
                Button("Discard Changes") {
                    firstName = viewModel.firstName
                    lastName = viewModel.lastName
                    email = viewModel.email
                    phoneNumber = viewModel.phoneNumber
                    
                    orderStatus = viewModel.orderStatus
                    passwordChanges = viewModel.passwordChanges
                    specialOffers = viewModel.specialOffers
                    newsletter = viewModel.newsletter
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(ButtonDiscardAction())
                Button("Save changes") {
                    if viewModel.validateInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                        viewModel.saveData(firstName: firstName,
                                           lastName: lastName,
                                           email: email,
                                           phoneNumber: phoneNumber,
                                           isLoggedIn: true,
                                           orderStatus: orderStatus,
                                           passChanges: passwordChanges,
                                           specialOffers: specialOffers,
                                           newsletter: newsletter)
                        self.presentation.wrappedValue.dismiss()
                    }
                }
                .buttonStyle(ButtonUpdateAction())
            }
            
        }
        .onAppear {
            firstName = viewModel.firstName
            lastName = viewModel.lastName
            email = viewModel.email
            phoneNumber = viewModel.phoneNumber
            
            orderStatus = viewModel.orderStatus
            passwordChanges = viewModel.passwordChanges
            specialOffers = viewModel.specialOffers
            newsletter = viewModel.newsletter
        }
        .alert("ERROR", isPresented: $viewModel.errorMessageShow, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(self.viewModel.errorMessage)
        })
        .navigationDestination(
             isPresented: $isLoggedOut) {
                 OnBoardingView()
             }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
