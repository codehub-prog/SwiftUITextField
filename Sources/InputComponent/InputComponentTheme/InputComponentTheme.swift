//
//  InputComponentTheme.swift
//  GoDost
//
//  Created by Anshul Kumar on 21/01/26.
//

import SwiftUI

@available(iOS 14.0, *)
struct InputComponentTheme {

    let colors: InputComponentColorTheme
    let fonts: InputComponentFontTheme
    let layout: InputComponentLayoutTheme
    let shadow: InputComponentShadowTheme?
    let glow: InputComponentGlowTheme?
}

@available(iOS 14.0, *)
extension InputComponentTheme {

    static let light = InputComponentTheme(

        colors: InputComponentColorTheme(
            text: .primary,
            placeholder: .primary.opacity(0.7),
            icon: .primary,
            border: .secondary.opacity(0.6),
            focusedBorder: .primary,
            errorBorder: .red,
            background: .clear,
            errorText: .red
        ),

        fonts: InputComponentFontTheme(
            titleFont: .caption,
            textFont: .body,
            errorFont: .caption2
        ),

        layout: InputComponentLayoutTheme(
            height: 56,
            cornerRadius: 8,
            horizontalPadding: 12,
            verticalPadding: 10,
            iconSize: 18
        ),

        shadow: InputComponentShadowTheme(
            color: .gray.opacity(0.1),
            radius: 6,
            x: 0,
            y: 4
        ),
        glow: InputComponentGlowTheme(
                    color: .primary,
                    radius: 18,
                    opacity: 0.6
                )
    )
}
