//
//  OnBoardingView.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject private var viewModel = OnBoardingViewModel()
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var phoneNumber = ""
    
    @State var isKeyboardVisible = false
    @State var contentOffset: CGSize = .zero
    
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HeaderView()
                    HeroView()
                        .padding()
                        .background(Color.primaryColor1)
                        .frame(maxWidth: .infinity, maxHeight: 240)
                    VStack {
                        Text("First name *")
                            .onboardingTextStyle()
                        TextField("First Name", text: $firstName)
                        Text("Last name *")
                            .onboardingTextStyle()
                        TextField("Last Name", text: $lastName)
                        Text("E-mail *")
                            .onboardingTextStyle()
                        TextField("E-mail", text: $email)
                            .keyboardType(.emailAddress)
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
                    
                    Button("Register") {
                        if viewModel.validateInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
                            viewModel.saveData(firstName: firstName,
                                               lastName: lastName,
                                               email: email,
                                               phoneNumber: phoneNumber,
                                               isLoggedIn: true,
                                               orderStatus: false,
                                               passChanges: false,
                                               specialOffers: false,
                                               newsletter: false)
                            isLoggedIn = true
                        }
                    }
                    .buttonStyle(ButtonYellow())
                    
                    Spacer()
                }
                .offset(y: contentOffset.height)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                    withAnimation {
                        let keyboardRect = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let keyboardHeight = keyboardRect.height
                        self.isKeyboardVisible = true
                        self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + 50)
                    }
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                    withAnimation {
                        self.isKeyboardVisible = false
                        self.contentOffset = .zero
                    }
                }
                .alert("ERROR", isPresented: $viewModel.errorMessageShow, actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text(self.viewModel.errorMessage)
                })
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: Constants.isLoggedInKey) {
                    isLoggedIn = true
                }
            }
            .navigationDestination(
                 isPresented: $isLoggedIn) {
                     HomeView()
                 }
        }
        .navigationBarBackButtonHidden()
        
    }
    
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
