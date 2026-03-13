//
//  InputComponent.swift
//  GoDost
//
//  Created by Anshul Kumar on 21/01/26.
//

import SwiftUI

@available(iOS 17, *)
public struct InputComponent: View {
    
    //MARK: - Class Instances and Variables
    let type: InputComponentType
    let style: InputComponentStyle
    let placeholder: LocalizedStringResource?
    @State private var text: String = ""
    @State private var error: String?
    @FocusState private var focused: Bool
    
    init(type: InputComponentType,
         style: InputComponentStyle = .rounded,
        placeholder: LocalizedStringResource? = nil) {
        self.type = type
        self.style = style
        self.placeholder = placeholder
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                if let icon = type.icon {
                    Image(systemName: icon)
                        .foregroundColor(focused ? type.theme.colors.focusedBorder : type.theme.colors.icon)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                }
                inputView
            }
            .frame(height: type.theme.layout.height)
            .padding(.horizontal, type.theme.layout.horizontalPadding)
            .background(backgroundView)
            .overlay(borderView)
            .modifier(
                FocusGlowModifier(
                    isFocused: focused,
                    glow: type.theme.glow,
                    cornerRadius: type.theme.layout.cornerRadius
                )
            )
            .focused($focused)
            .onChange(of: text, { oldValue, newValue in
                applyRules(newValue)
            })
            if let error {
                Text(error)
                    .font(type.theme.fonts.errorFont)
                    .foregroundColor(type.theme.colors.errorText)
            }
        }
    }
}

@available(iOS 17, *)
extension InputComponent {

    @ViewBuilder
    var inputView: some View {

        if type.isSecure {
            SecureField(placeholder ?? type.defaultPlaceholder.localized, text: $text)
        } else {
            if #available(iOS 26.0, *) {
                TextField(placeholder ?? type.defaultPlaceholder.localized, text: $text)
                    .keyboardType(type.keyboard)
                    .textInputAutocapitalization(type.capitalization)
            } else {
                TextField(text: $text) { }
            }
        }
    }

    func applyRules(_ value: String) {

        if let max = type.maxLength {
            text = String(value.prefix(max))
        }

        error = type.validate(text)
    }
}

@available(iOS 17, *)
extension InputComponent {

    @ViewBuilder
    var borderView: some View {

        let borderColor =
            error != nil ? type.theme.colors.errorBorder :
            focused ? type.theme.colors.focusedBorder :
            type.theme.colors.border

        switch style {

        case .rounded:
            RoundedRectangle(cornerRadius: type.theme.layout.height * 0.5)
                .stroke(borderColor, lineWidth: 1)
        case .dashed:
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius)
                .stroke(
                    borderColor,
                    style: StrokeStyle(lineWidth: 1, dash: [6])
                )
        case .underline:
            VStack {
                Spacer()
                Rectangle()
                    .fill(borderColor)
                    .frame(height: 1)
            }

        case .bordered(let width):
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius)
                .stroke(borderColor, lineWidth: CGFloat(width))
        case .curved:
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius * 2)
                .stroke(borderColor, lineWidth: 1)
        case .threeD, .shadow:
            EmptyView()
        case .custom(let value):
            RoundedRectangle(cornerRadius: CGFloat(value))
                .stroke(borderColor, lineWidth: 1)
        }
    }
}

@available(iOS 17, *)
extension InputComponent {

    @ViewBuilder
    var backgroundView: some View {

        switch style {
        case .rounded:
            RoundedRectangle(cornerRadius: type.theme.layout.height * 0.5)
                .fill(type.theme.colors.background)
        case .dashed, .underline:
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius)
                .fill(type.theme.colors.background)
        case .bordered:
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius)
                .fill(type.theme.colors.background)
        case .custom(let radius):
            RoundedRectangle(cornerRadius: CGFloat(radius))
                .fill(type.theme.colors.background)
        case .curved:
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius * 2)
                .fill(type.theme.colors.background)
        case .shadow(let radius):
            RoundedRectangle(cornerRadius: CGFloat(radius))
                .fill(type.theme.colors.background)
                .shadow(
                    color: type.theme.shadow?.color ?? .black.opacity(0.15),
                    radius: type.theme.shadow?.radius ?? 6,
                    x: type.theme.shadow?.x ?? 0,
                    y: type.theme.shadow?.y ?? 4
                )
        case .threeD:
            RoundedRectangle(cornerRadius: type.theme.layout.cornerRadius)
                .fill(type.theme.colors.background)
                .shadow(color: .white.opacity(0.8), radius: 2, x: -2, y: -2)
                .shadow(color: .black.opacity(0.2), radius: 4, x: 4, y: 4)
        }
    }
}

@available(iOS 13.0, *)
struct FocusGlowModifier: ViewModifier {

    let isFocused: Bool
    let glow: InputComponentGlowTheme?
    let cornerRadius: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        glow?.color.opacity(isFocused ? glow?.opacity ?? 0 : 0) ?? Color.primary,
                        lineWidth: 2
                    )
                    .blur(radius: isFocused ? glow?.radius ?? 0 : 0)
            )
            .animation(
                .easeInOut(duration: 0.35),
                value: isFocused
            )
    }
}

@available(iOS 17, *)
#Preview {
    InputComponent(type: .email, style: .shadow(20), placeholder: "Email")
}
