//
//  NetworkService.swift
//  StarbucksHomeScreen
//
//  Created by Олег Федоров on 17.03.2022.
//

import Foundation

struct History: Codable {
    let transactions: [Transaction]
}

struct Transaction: Codable {
    let id: Int
    let type: String
    let amount: String
    let description: String?
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case amount
        case description
        case date = "processed_at"
    }
}

enum ServerError: Error {
    case server
    case parsing
}
 
class NetworkService {
    
    static let shared = NetworkService()
    
    private let historyURL = "https://uwyg0quc7d.execute-api.us-west-2.amazonaws.com/prod/history"
    
    private init() { }
    
    func fetchTransactions(
        completion: @escaping (Result<[Transaction], Error>) -> Void
    ) {
        guard
            let url = URL(string: historyURL)
        else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
            }
            
            guard
                let data = data,
                let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            else {
                completion(.failure(ServerError.server))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let result = try decoder.decode(History.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(result.transactions))
                }
            } catch {
                completion(.failure(ServerError.parsing))
            }
        }
        
        task.resume()
    }
}
