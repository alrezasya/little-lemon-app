//
//  Styles.swift
//  LittleLemonApps
//
//  Created by Reza Alamsyah on 21/10/23.
//

import SwiftUI

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color.primaryColor1)
            .font(.custom("Karla-Bold", size: 13))
    }
}

extension Font {
    static func displayFont() -> Font {
        return Font.custom("Markazi Text", size: 42).weight(.medium)
    }
    
    static func subTitleFont() -> Font {
        return Font.custom("Markazi Text", size: 32)
    }
    
    static func leadText() -> Font {
        return Font.custom("Karla", size: 16).weight(.medium)
    }
    
    static func regularText() -> Font {
        return Font.custom("Markazi Text", size: 18)
    }
    
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18).weight(.black)
    }
    
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 16).weight(.heavy)
    }
    
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 14)
    }
    
    static func highlightText() -> Font {
        return Font.custom("Karla", size: 14).weight(.medium)
    }
}


extension Color {
    static let blackColor = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))

    static let primaryColor1 = Color(#colorLiteral(red: 0.1615352713, green: 0.2068517322, blue: 0.1913262785, alpha: 1))
    static let primaryColor2 = Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))
    
    static let secondaryColor1 = Color(#colorLiteral(red: 0.989240706, green: 0.5802358389, blue: 0.4141188264, alpha: 1))
    static let secondaryColor2 = Color(#colorLiteral(red: 1, green: 0.8488721251, blue: 0.7164030075, alpha: 1))
    
    static let highlightColor1 = Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    static let highlightColor2 = Color(#colorLiteral(red: 0.1999999881, green: 0.1999999881, blue: 0.1999999881, alpha: 1))
}


struct ButtonYellow: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ButtonUpdateAction: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color.primaryColor1)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonDiscardAction: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct CustomToggle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(Color.primaryColor1)
        .padding(5)
        .background {
            if configuration.isOn {
                Color.highlightColor1
            }
        }
        .cornerRadius(8)
    }
}

struct ButtonToggle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color.primaryColor1)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            )
            .padding(.horizontal)
    }
}
