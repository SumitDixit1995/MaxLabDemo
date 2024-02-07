//
//  ApiError.swift
//  MaxLabDemo
//
//  Created by Sumit Kumar on 07/02/24.
//

import Foundation

enum AppError: Error, CaseIterable {
    case invalidRequest
    case invalidHttpMethod
    case invalidEmail
    case invalidPassword
    case invalidPhoneNumber
    case noNetwork
    case badRequest
    case timeOut
    case invalidData
    case invalidBearerToken
    case weakSelf
    case none
}

extension AppError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString("Description of no request", comment: "Request not found")
        case .invalidHttpMethod:
            return NSLocalizedString("Description of no http method", comment: "Http method not found")
        case .invalidEmail:
            return NSLocalizedString("Description of invalid email address", comment: "Invalid Email")
        case .invalidPassword:
            return NSLocalizedString("Description of invalid password", comment: "Invalid Password")
        case .invalidPhoneNumber:
            return NSLocalizedString("Description of invalid phoneNumber", comment: "Invalid Phone Number")
        case .noNetwork:
            return NSLocalizedString("No Internet Connection", comment: "No Internet Connection")
        case .badRequest:
            return NSLocalizedString("Description of bad request", comment: "Bad request")
        case .timeOut:
            return NSLocalizedString("Description of time out", comment: "Timeout Error")
        case .invalidData:
            return NSLocalizedString("Description of invalid data", comment: "Not able to convert JSON to Data")
        case .weakSelf:
            return NSLocalizedString("Description of weak self", comment: "Object deallocate due weak self")
        case .invalidBearerToken:
            return NSLocalizedString("Description of Bearer Token", comment: "InvalidBearerToken")
        case .none:
           return NSLocalizedString("Description of None", comment: "Unknown Error")
}
    }
}
