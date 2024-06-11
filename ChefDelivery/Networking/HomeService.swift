//
//  HomeService.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 10/06/24.
//

import Foundation

enum RequestError: Error {
    case invalidUrl
    case errorRequest(error: String)
}

struct HomeService {
    
    func fetchData() async throws -> Result<[StoreType], RequestError> {
        guard let url = URL(string: "https://private-720c2-derlandybelchior.apiary-mock.com/home") else {
            return .failure(.invalidUrl)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        return .success(storesObjects)
    }
    
    
    func confirmOrder(_ product: ProductType) async throws -> Result<[String: String]?, RequestError> {
        guard let url = URL(string: "https://private-720c2-derlandybelchior.apiary-mock.com/home") else {
            return .failure(.invalidUrl)
        }

        let encodedObject = try JSONEncoder().encode(product)
            
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
            
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: String]
            
        return .success(message)
    }

}

//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let data = data {
//                let storeObjects = try? JSONDecoder().decode([StoreType].self, from: data)
//                print(storeObjects)
//            }
//        }
//
//        task.resume()
