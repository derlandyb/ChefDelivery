//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 06/06/24.
//

import SwiftUI


struct ContentView: View {
    
    // MARK: Attributes
    private let service = HomeService()
    @State private var stores: [StoreType] = []
    @State private var isLoading = true
    
    // MARK: Views
    var body: some View {
        NavigationView {
            VStack {
                
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20) {
                            OrderTypeGridView()
                            CarouselTabView()
                            StoreContainerView(stores: stores)
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
                case .success(let stores):
                self.stores = stores
                self.isLoading = false
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                self.isLoading = false
            }
        } catch {
            print(error.localizedDescription)
            self.isLoading = false
        }
    }
}

#Preview {
    ContentView()
        .previewLayout(.sizeThatFits)
}
