//
//  AccessibilityIdentifierModifier.swift
//  AccessibilityIdentifierModifier
//
//  Created by Cem Kazım on 8.04.2023.
//

import SwiftUI

struct AccessibilityIdentifierModifier: ViewModifier {
    
    // MARK: - Properties
    
    var accessibilityIdentifier: String
    
    // MARK: - Methods
    
    func body(content: Content) -> some View {
        return content
            .background(
                AccessibilityIdentifierModifierView(accessibilityIdentifier: accessibilityIdentifier)
            )
    }
}

struct AccessibilityIdentifierModifierView: UIViewRepresentable {
    
    // MARK: - Properties
    
    var accessibilityIdentifier: String
    
    // MARK: - Methods
    
    func makeUIView(context: Context) -> some UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.accessibilityIdentifier = accessibilityIdentifier
    }
}

// MARK: - Extension View

extension View {
    
    func accessId(_ identifier: String) -> some View {
        self.modifier(
            AccessibilityIdentifierModifier(accessibilityIdentifier: identifier)
        )
    }
}

// MARK: - Example

struct ContentView: View {
    
    var body: some View {
        Text("Listen to Cem Kazim songs and be ecstatic.")
            .accessId("ENTER_THE_ACCESSIBILITY_IDENTIFIER_HERE")
    }
}
