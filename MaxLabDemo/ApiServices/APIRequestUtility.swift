//
//  APIRequestUtility.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation

protocol APIRequestUtility: Any {
    func fetchHealthTopics() -> URLRequest?
    func fetchHealthTopicsDetail(id: String) -> URLRequest?
}

struct APIRequest: APIRequestUtility {
    
    func fetchHealthTopics() -> URLRequest? {
        let absoluteURLString = "https://health.gov/myhealthfinder/api/v3/topicsearch.json"
        return createURLRequest(absoluteURLString: absoluteURLString)
    }
    
    func fetchHealthTopicsDetail(id: String) -> URLRequest? {
        let absoluteURLString = "https://health.gov/myhealthfinder/api/v3/topicsearch.json?TopicId=\(id)"
        return createURLRequest(absoluteURLString: absoluteURLString)
    }
}

extension APIRequest {
    func createURLRequest(absoluteURLString: String = "") -> URLRequest? {
            // URL of the endpoint you want to send the GET request to
            guard let url = URL(string: absoluteURLString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
                print("Invalid URL")
                return nil
            }
            // Create a GET request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            // Optional: Set additional headers if needed
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
    }
}

