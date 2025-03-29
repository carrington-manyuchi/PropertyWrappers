//
//  ExtractSubViews.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/29.
//

import SwiftUI

struct ExtractSubViewsBootcamp: View {
    
    @State var backgroundColor: Color = .cyan
    
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
            .navigationTitle("Extract Subviews")
        }
    }
}

private extension ExtractSubViewsBootcamp {
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Bananas", count: 31, color: .yellow)
            MyItem(title: "Oranges", count: 13, color: .orange)
        }
    }
}

#Preview {
    ExtractSubViewsBootcamp()
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
            Text(title)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
        )
        .shadow(radius: 5)
    }
}
