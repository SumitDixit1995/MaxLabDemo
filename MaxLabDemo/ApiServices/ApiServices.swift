//
//  ApiServices.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation

//API ApiServices
struct ApiServices: ApiServiceable {
    func getRequestJSON(request: URLRequest?, _ completion: @escaping ResponseResult) {
        guard let request = request else{
            print("Request Not Found ")
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
