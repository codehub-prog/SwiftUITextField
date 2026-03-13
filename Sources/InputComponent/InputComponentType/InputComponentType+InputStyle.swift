//
//  InputComponentType+InputStyle.swift
//  GoDost
//
//  Created by Anshul Kumar on 21/01/26.
//

import SwiftUI

@available(iOS 15.0, *)
extension InputComponentType {
    var keyboard: UIKeyboardType {
        switch self {
        case .email: return .emailAddress
        case .amount: return .decimalPad
        case .phoneNumber, .otp, .age, .datePicker: return .numberPad
        default: return .default
        }
    }
    var capitalization: TextInputAutocapitalization {
        switch self {
        case .name, .address: return .words
        default: return .never
        }
    }
    
    var isSecure: Bool {
        switch self {
        case .password: return true
        default: return false
        }
    }
    
    var maxLength: Int? {
        switch self {
        case .otp: return 6
        case .postalCode: return 6
        case .phoneNumber: return 10
        case .age: return 3
        default: return nil
        }
    }
}
