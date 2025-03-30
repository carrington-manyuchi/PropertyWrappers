//
//  BindingBootcamap.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/29.
//

import SwiftUI

struct BindingBootcamap: View {
    
    @State var backgroundColor: Color = .red
    @State var title: String = "This is the title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text(title)
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                    ButtonView(backgroundColor: $backgroundColor, title: $title)

                }
            }
        }
    }
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor: Color = .blue
    
    var body: some View {
        Button {
            backgroundColor = .orange
            buttonColor = .pink
            title = "Button Tapped!"
        } label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(buttonColor)
                )
                .shadow(radius: 10)
        }
    }
}

#Preview {
    BindingBootcamap()
}
