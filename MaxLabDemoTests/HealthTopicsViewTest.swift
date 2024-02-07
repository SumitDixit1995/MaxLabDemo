//
//  HealthTopicsViewTest.swift
//  MaxLabDemoTests
//
//  Created by Sumit Kumar on 07/02/24.
//

import XCTest
@testable import MaxLabDemo // Replace YourAppName with the name of your app module

class HealthTopicsViewTests: XCTestCase {

        var apiManager = HealthTopicsApiManager(with: ApiServicesMock())
        
    func testfetchHealthTopics() {
            apiManager.fetchHealthTopics(APIRequest().fetchHealthTopics(), for: HealthTopics.self) { result in
                XCTAssertNotNil(result)
                switch result {
                case let .success(response):
                    XCTAssertEqual(response.result.resources.resource.first?.idx ?? "", "527")
                case let .failure(error):
                    print(error)
                }
            }
    }
    
    
    func testHealthTopicsView() {
        apiManager.fetchHealthTopics(APIRequest().fetchHealthTopicsDetail(id: "527"), for: HealthTopics.self) { result in
            XCTAssertNotNil(result)
            switch result {
            case let .success(response):
                XCTAssertEqual(response.result.resources.resource.first?.idx ?? "", "527")
            case let .failure(error):
                print(error)
            }
        }
    }
}
