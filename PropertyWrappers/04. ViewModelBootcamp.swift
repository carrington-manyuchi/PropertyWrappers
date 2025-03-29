//
//  ViewModelBootcamp.swift
//  PropertyWrappers
//
//  Created by Manyuchi, Carrington C on 2025/03/29.
//

import SwiftUI

struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getFruits()
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 31)
        let fruit4 = FruitModel(name: "Apples", count: 64)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.fruitArray.append(contentsOf: [fruit1, fruit2, fruit3, fruit4])
            self?.isLoading = false
        }
    }
    
    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }
}

struct ViewModelBootcamp: View {

    // @StateObject -> USE THIS ON CREATION / INIT
    // @ObservedObject -> USE THIS FOR SUBVIEWS
    @StateObject var fruitViewModel: FruitViewModel = .init()
    
    var body: some View {
        NavigationStack {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Fruit List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        SecondScreen(fruitViewModel: fruitViewModel)
                    } label: {
                        Image(systemName: "arrow.right")
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var fruitViewModel: FruitViewModel
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
            }

            
            
        }
    }
}

#Preview {
    ViewModelBootcamp()
}
