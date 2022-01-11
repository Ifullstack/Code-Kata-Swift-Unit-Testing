//
//  ExampleTest+ViewModel.swift
//  Code Kata Testing
//
//  Created by Cane Allesta on 10/1/22.
//

import Foundation

enum HomeErrors: Error {
    case invalidPassword, serviceError, missingData, invalidUrl
}

enum ColorsItems {
    case navigationBars, headers, labels, background
}

struct ProductModel: Codable {
    let id: Int
    let title, body: String
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, body
        case userID = "userId"
    }
}

class HomeViewModel {
    
    func isUserLogged() -> Bool {
        // Make API call or use some model value
        return true
    }
    
    func formatPrice(price: String) -> String? {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = Locale(identifier: "ca_ES")
        
        if let double = Double(price),
            let formatPrice = nf.string(from: NSNumber(value: double)) {
            return formatPrice
        }
        
        return nil
    }
    
    func getUserUid() -> String {
        // Make API call and receive the value here
        let uid = "202201"
        return uid
    }
    
    func getProductSubscriptionUid() -> String {
        // Make API call or use some model value
        let productId = "202201"
        return productId
    }
    
    func areEqualsUids() -> Bool {
        return getUserUid() == getProductSubscriptionUid() ? true : false
    }
    
    func isValidPassword(password: String) throws -> Bool {
        if password.contains("*") {
            throw HomeErrors.invalidPassword
        }
        return true
    }
    
    func getUserEmail() -> String? {
        // Make API call or use some model value
        return "user@gmail.com"
    }
    
    func generateColorHexaDecimal(for item: ColorsItems) -> String? {
        switch item {
            case .navigationBars:
                return "#FF5733"
            case .headers:
                return "#F3FF33"
            case .labels:
                return "black"
            case .background:
                return "#33CAFF"
        }
    }
    
    func getUserModel() -> ProductModel {
        return ProductModel(id: 1, title: "IPhone 13 Pro", body: "", userID: 112)
    }
    
    func fetchUserModel(completion: @escaping (Result<ProductModel, Error>) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else {
            completion(.failure(HomeErrors.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let _ = error {
                completion(.failure(HomeErrors.serviceError))
                return
            }
            
            guard let data = data else {
                completion(.failure(HomeErrors.missingData))
                return
            }
            
            do {
                let model = try JSONDecoder().decode(ProductModel.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
    
}
