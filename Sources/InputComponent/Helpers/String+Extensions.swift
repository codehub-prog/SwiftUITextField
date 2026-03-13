//
//  String+Extensions.swift
//  SwiftUITextField
//
//  Created by Anshul Kumar on 13/03/26.
//

import Foundation

@available(iOS 16, *)
extension String {
    var localized: LocalizedStringResource {
        LocalizedStringResource(stringLiteral: self)
    }
}
