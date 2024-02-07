//
//  HealthTopicsViewModel.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//


import Foundation
import SwiftUI

class HealthTopicsViewModel : HealthTopicsProtocol{

    @Published var healthTopics: [HealthTopic]?
    var apiManager = HealthTopicsApiManager(with: ApiServices())
    
    //MARK:- All Topics
    func fetchHealthTopics(_ completion: @escaping (Bool) -> Void) {
        apiManager.fetchHealthTopics(APIRequest().fetchHealthTopics(), for: HealthTopics.self) { result in
            print(result)
            switch result {
            case let .success(response):
                self.healthTopics = response.result.resources.resource
                completion(true)
            case let .failure(error):
                print(error)
                completion(false)
            }
        }
    }
    
    //MARK:- TopicsDetail
    func fetchHealthTopicsDetail(id: String, _ completion: @escaping (HealthTopic?) -> Void) {
        apiManager.fetchHealthTopicsDetail(APIRequest().fetchHealthTopicsDetail(id: id), for: HealthTopics.self) { result in
            print(result)
            switch result {
            case let .success(response):
                let topic = response.result.resources.resource.first
                completion(topic)
            case let .failure(error):
                print(error)
                completion(nil)
            }
        }
    }
}
    

