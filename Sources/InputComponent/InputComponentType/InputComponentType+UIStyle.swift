//
//  InputComponentType+UIStyle.swift
//  GoDost
//
//  Created by Anshul Kumar on 21/01/26.
//

import Foundation

extension InputComponentType {

    var icon: String? {
        switch self {
        case .email: return "envelope"
        case .password, .otp: return "lock"
        case .phoneNumber: return "phone"
        case .dropDown: return "chevron.down"
        case .search: return "magnifyingglass"
        case .postalCode, .address: return "map"
        case .datePicker: return "calendar"
        case .amount: return "currency.usd"
        case .age: return "person.crop.circle"
        case .name: return "person"
        default: return nil
        }
    }

    var defaultStyle: InputComponentStyle {
        switch self {
        case .search: return .curved
        case .password: return .threeD
        case .otp: return .underline
        case .phoneNumber: return .dashed
        default: return .rounded
        }
    }
    
    var defaultPlaceholder: String {
        switch self {
        case .email: return "Email"
        case .password: return "Password"
        case .phoneNumber: return "Phone Number"
        case .otp: return "OTP"
        case .search: return "Search"
        case .name: return "Name"
        case .address: return "Address"
        case .dropDown: return "Select Item"
        case .postalCode: return "Postal Code"
        case .datePicker: return "Date"
        case .age: return "Age"
        case .amount: return "Amount"
        case .custom: return "Custom"
        }
    }
}
