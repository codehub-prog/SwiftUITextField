//
//  InputComponentType+Validations.swift
//  GoDost
//
//  Created by Anshul Kumar on 21/01/26.
//

import Foundation

extension InputComponentType {

    func validate(_ text: String) -> String? {
        if text.isEmpty {
            return "Required field"
        }
        switch self {
        case .email:
            return text.contains("@") ? nil : "Invalid email"
        case .phoneNumber:
            return text.count == 10 ? nil : "Phone must be 10 digits"
        case .otp:
            return text.count == 6 ? nil : "OTP must be 6 digits"
        case .postalCode:
            return text.count == 6 ? nil : "Postal Code must be 6 digits"
        default:
            return nil
        }
    }
}
