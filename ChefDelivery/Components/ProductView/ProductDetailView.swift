//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 08/06/24.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product: ProductType
    
    var service = HomeService()
    
    @State private var productQuantity = 1
    
    @State private var showAlert = false
    
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            
            ProductDetailHeaderView(product: product)
            
            Spacer()
            
            ProductDetailQuantityView(productQuantity: $productQuantity)
            
            Spacer()
            
            ProductDetailButtonView {
                Task {
                    await confirmOrder()
                }
            }
        }
        .foregroundColor(.black)
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Atenção"), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
        })
    }
    
    func confirmOrder() async {
        do {
            let result = try await service.confirmOrder(product)
            
            switch result {
            case .success(let message):
                if let message = message {
                    alertMessage = message["message"] ?? ""
                    if !alertMessage.isEmpty {
                        showAlert = true
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    
    var onButtonClick: () -> Void
    
    var body: some View {
        Button(
            action: {
                onButtonClick()
            },
            label: {
                HStack {
                    Image(systemName: "cart")
                    
                    Text("Adicionar ao carrinho")
                }
                .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .background(Color("ColorRed"))
                .foregroundColor(.white)
                .cornerRadius(32)
                .shadow(color: Color("ColorRedDark").opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 6, y: 8)
            }
        )
    }
}
