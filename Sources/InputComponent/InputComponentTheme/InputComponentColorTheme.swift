//
//  InputComponentColorTheme.swift
//  GoDost
//
//  Created by Anshul Kumar on 21/01/26.
//

import SwiftUI

@available(iOS 13.0, *)
struct InputComponentColorTheme {

    let text: Color
    let placeholder: Color
    let icon: Color

    let border: Color
    let focusedBorder: Color
    let errorBorder: Color

    let background: Color
    let errorText: Color
}

@available(iOS 13.0, *)
struct InputComponentGlowTheme {
    let color: Color
    let radius: CGFloat
    let opacity: Double
}
