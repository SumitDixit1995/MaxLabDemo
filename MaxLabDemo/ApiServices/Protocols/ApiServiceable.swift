//
//  ApiServiceable.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation

protocol ApiServiceable {
    typealias ResponseResult = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    func getRequestJSON(request: URLRequest?, _ completion: @escaping ResponseResult)
}

