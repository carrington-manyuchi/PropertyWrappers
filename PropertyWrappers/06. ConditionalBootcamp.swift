//
//  COnditionalBootcamp.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/29.
//

import SwiftUI

struct ConditionalBootcamp: View {
    
    @State var showCircle: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Button("Circle Button : \(showCircle.description)") {
                        showCircle.toggle()
                    }
                    
                    if showCircle {
                        
                        Circle()
                            .frame(width: 100, height: 100)
                        
                    } else {
                        Rectangle()
                            .frame(width: 100, height: 100)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ConditionalBootcamp()
}
