//
//  StateBootcamp.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/29.
//

import SwiftUI

struct StateBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "My title"
    @State var count: Int = 0
    
   var body: some View {
                
        NavigationStack {
            ZStack {
                backgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                        VStack {
                            Divider()
                                .padding(.vertical, 20)
                            
                            VStack(spacing: 20) {
                                Text(myTitle)
                                    .font(.title)
                                Text("Count: \(count)")
                                    .font(.headline)
                                    .underline()
                                
                                HStack(spacing: 20) {
                                    Button("Button 1") {
                                        backgroundColor = .red
                                        myTitle = "Button 1 was pressed"
                                        count += 1
                                    }
                                    
                                    Button("Button 2") {
                                        backgroundColor = .purple
                                        myTitle = "Button 2 was pressed"
                                        count -= 1
                                    }
                                }
                            }
                            .foregroundStyle(.white)
                        }
                        
                    }
                    .navigationTitle("State Bootcamp")
            }
        }
    }
}

#Preview {
    StateBootcamp()
}
