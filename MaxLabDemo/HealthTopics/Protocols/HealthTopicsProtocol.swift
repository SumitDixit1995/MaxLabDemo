//
//  HealthTopicsProtocol.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation

protocol HealthTopicsProtocol{
    var healthTopics : [HealthTopic]? { get set }
    func fetchHealthTopics(_ completion: @escaping (Bool)->Void)
    func fetchHealthTopicsDetail(id: String, _ completion: @escaping (HealthTopic?)->Void)
}
