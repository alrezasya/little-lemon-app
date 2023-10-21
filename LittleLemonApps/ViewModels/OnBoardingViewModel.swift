//
//  OnBoardingViewModel.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import Foundation



class OnBoardingViewModel: ObservableObject {
    
    @Published var firstName = UserDefaults.standard.string(forKey: Constants.firstNameKey) ?? ""
    @Published var lastName = UserDefaults.standard.string(forKey: Constants.lastNameKey) ?? ""
    @Published var email = UserDefaults.standard.string(forKey: Constants.emailKey) ?? ""
    @Published var phoneNumber = UserDefaults.standard.string(forKey: Constants.phoneNumberKey) ?? ""
    @Published var orderStatus = UserDefaults.standard.bool(forKey: Constants.orderStatusKey)
    @Published var passwordChanges = UserDefaults.standard.bool(forKey: Constants.passwordChangesKey)
    @Published var specialOffers = UserDefaults.standard.bool(forKey: Constants.specialOffersKey)
    @Published var newsletter = UserDefaults.standard.bool(forKey: Constants.newsletterKey)
    
    
    @Published var errorMessageShow = false
    @Published var errorMessage = ""
    
    @Published var searchText = ""
    
    func validateInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
        
        // customerName must contain just letters
        let firstNameIsValid = isValid(name: firstName)
        let lastNameIsValid = isValid(name: lastName)
        let emailIsValid = isValid(email: email)
        
        guard firstNameIsValid && lastNameIsValid && emailIsValid
        else {
            if firstName.isEmpty || lastName.isEmpty || !isValid(name: firstName) || !isValid(name: lastName){
                errorMessage = "Names can only contain letters and must have at least 3 characters\n\n"
                errorMessageShow = true
            }
            
            if phoneNumber.isEmpty && phoneNumber.count < 10 {
                errorMessage = "The phone number cannot be blank or invalid phone number"
                errorMessageShow = true
            }
            
            if !email.isEmpty || !isValid(email: email) {
                errorMessage = "The e-mail is invalid or cannot be blank."
                errorMessageShow = true
            }
            
            errorMessage = "All fields must be filled in"
            errorMessageShow = true
            
            return false
        }
        

        errorMessageShow = false
        errorMessage = ""
        return true
    }
    
    private func isValid(name: String) -> Bool {
        guard !name.isEmpty,
              name.count > 2
        else { return false }
        for chr in name {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    private func isValid(email:String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
    
    func saveData(firstName: String,
                  lastName: String,
                  email: String,
                  phoneNumber: String,
                  isLoggedIn: Bool,
                  orderStatus: Bool,
                  passChanges: Bool,
                  specialOffers: Bool,
                  newsletter: Bool) {
        UserDefaults.standard.set(firstName, forKey: Constants.firstNameKey)
        UserDefaults.standard.set(lastName, forKey: Constants.lastNameKey)
        UserDefaults.standard.set(email, forKey: Constants.emailKey)
        UserDefaults.standard.set(phoneNumber, forKey: Constants.phoneNumberKey)
        UserDefaults.standard.set(isLoggedIn, forKey: Constants.isLoggedInKey)
        UserDefaults.standard.set(orderStatus, forKey: Constants.orderStatusKey)
        UserDefaults.standard.set(passChanges, forKey: Constants.passwordChangesKey)
        UserDefaults.standard.set(specialOffers, forKey: Constants.specialOffersKey)
        UserDefaults.standard.set(newsletter, forKey: Constants.newsletterKey)
    }
    
    func clearData() {
        UserDefaults.standard.set("", forKey: Constants.firstNameKey)
        UserDefaults.standard.set("", forKey: Constants.lastNameKey)
        UserDefaults.standard.set("", forKey: Constants.emailKey)
        UserDefaults.standard.set("", forKey: Constants.phoneNumberKey)
        UserDefaults.standard.set(false, forKey: Constants.isLoggedInKey)
        UserDefaults.standard.set(false, forKey: Constants.orderStatusKey)
        UserDefaults.standard.set(false, forKey: Constants.passwordChangesKey)
        UserDefaults.standard.set(false, forKey: Constants.specialOffersKey)
        UserDefaults.standard.set(false, forKey: Constants.newsletterKey)
    }
}
