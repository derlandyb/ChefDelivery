//
//  Double+.swift
//  ChefDelivery
//
//  Created by Derlandy Belchior on 08/06/24.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
