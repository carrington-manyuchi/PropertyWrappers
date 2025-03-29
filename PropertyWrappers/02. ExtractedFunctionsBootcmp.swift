//
//  ExtractedFunctionsBootcmp.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/29.
//

import SwiftUI

struct ExtractedFunctionsBootcmp: View {
    
    @State var backgroundColor: Color = .red
    @State var title: String = "Title"
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        contentLayer
                    }
                }
            }
            .navigationTitle("Extracted Functions")
        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
        title = "Carrington"
    }
}

private extension ExtractedFunctionsBootcmp {
    var contentLayer: some View {
            VStack {
                Text(title)
                    .font(.largeTitle)
                
                Button {
                    buttonPressed()
                } label: {
                    Text("Press Me".uppercased())
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.black)
                        )
                        .shadow(radius: 100)
                }

            }
    }
}


#Preview {
    ExtractedFunctionsBootcmp()
}
