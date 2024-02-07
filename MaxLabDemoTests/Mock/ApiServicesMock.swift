//
//  ApiServicesMock.swift
//  MaxLabDemoTests
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation
@testable import MaxLabDemo

//API ApiServices
struct ApiServicesMock: ApiServiceable {
    func getRequestJSON(request: URLRequest?, _ completion: @escaping ResponseResult) {
        let bundle = Bundle.main
        guard let fileUrl = bundle.url(forResource: "response", withExtension: "json")else {
            return
        }
        let data = try? Data(contentsOf: fileUrl, options: .mappedIfSafe)
        completion(data, nil, nil)
    }
}
