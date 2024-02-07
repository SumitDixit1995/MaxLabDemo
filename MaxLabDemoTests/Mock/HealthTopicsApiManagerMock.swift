//
//  HealthTopicsApiManager.swift
//  MaxLabDemoTests
//
//  Created by Sumit Kumar on 07/02/24.
//


import Foundation
@testable import MaxLabDemo

class HealthTopicsApiManager : HealthTopicsApiProtocal{
   
    var services: ApiServiceable
    
    init(with services: ApiServiceable) {
        self.services = services
    }
    
    func fetchHealthTopics<T>(_ request: URLRequest?, for: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        services.getRequestJSON(request: request) { data, response, error in
            guard let data = data else {
                return completion(.failure(error ?? AppError.invalidData))
            }
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(T.self, from: data)
                return completion(.success(decoded))
            }
            catch let decodingError {
                //debugPrint(decodingError.localizedDescription)
                return completion(.failure(decodingError))
            }
        }
    }
    
    func fetchHealthTopicsDetail<T>(_ request: URLRequest?, for: T.Type, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        services.getRequestJSON(request: request) { data, response, error in
            guard let data = data else {
                return completion(.failure(error ?? AppError.invalidData))
            }
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(T.self, from: data)
                return completion(.success(decoded))
            }
            catch let decodingError {
                //debugPrint(decodingError.localizedDescription)
                return completion(.failure(decodingError))
            }
        }
    }
    
}
