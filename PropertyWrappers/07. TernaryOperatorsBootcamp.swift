//
//  TernaryOperatorsBootcamp.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/30.
//

import SwiftUI

struct TernaryOperatorsBootcamp: View {
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            if isStartingState {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red)
                    .frame(width: 200, height: 100)
            } else {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.blue)
                    .frame(width: 200, height: 100)
            }
            
            
        }
    }
}

#Preview {
    TernaryOperatorsBootcamp()
}
