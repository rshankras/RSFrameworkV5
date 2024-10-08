//
//  AnimatedButton.swift
//  RSFrameworkV4
//
//  Created by Ravi Shankar on 08/10/24.
//

import SwiftUI

public struct AnimatedButton: View {
    
    public typealias UserAction = (() -> Void)
    
    private let text: String
    private let systemImageName: String?
    private let action: UserAction
    private let color1: Color
    private let color2: Color
    
    public init(text: String, systemImageName: String? = nil, color1: Color = .green, color2: Color = .orange,action: @escaping UserAction) {
        self.text = text
        self.systemImageName = systemImageName
        self.action = action
        self.color1 = color1
        self.color2 = color2
    }
    
    public var body: some View {
        Button(action: {
            action()
        }) {
            HStack {
                if let imageName = systemImageName {
                    Image(systemName:imageName)
                }
                Text(text)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .buttonStyle(InteractiveButtonStyle(color1: color1, color2: color2))
    }
}

struct InteractiveButtonStyle: ButtonStyle {
    
    @State var color1:Color
    @State var color2:Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? color1 : color2)
            .cornerRadius(10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .foregroundColor(.white)
    }
}

#Preview {
    AnimatedButton(text: "Refresh") {
        //
    }
}
