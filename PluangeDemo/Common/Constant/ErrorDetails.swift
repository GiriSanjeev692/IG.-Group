//
//  ErrorDetails.swift
//  ErrorDetails
//
//  Created by Sanjeev Kumar on 09/11/21.
//

import Foundation

// MARK: - Network related

struct ErrorDetails: Error, Codable {
    var error: String?
    var errorCode: String?
    var httpStatusCode: String? = ""
    var message: String?
    private var errorMessage: String?
    var path: String?
    var isSessionExpired: Bool = false
    var errorType: ErrorTypes?
    var description: String?
    var receipt: String?

    enum CodingKeys: String, CodingKey {
        case error
        case errorCode
        case message
        case path
        case errorMessage
    }

    init(errorType: ErrorTypes? = nil, message: String, sessionExpired: Bool = false) {
        self.errorType = errorType
        self.message = message
        isSessionExpired = sessionExpired
    }

    init(description: String?, message: String, receipt: String?, errorCode: String?) {
        self.description = description
        self.message = message
        self.receipt = receipt
        self.errorCode = errorCode
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try? values.decodeIfPresent(String.self, forKey: .error)
        errorCode = try? values.decodeIfPresent(String.self, forKey: .errorCode)
        if errorCode == nil {
            if let integerErrorCode = try? values.decodeIfPresent(Int.self, forKey: .errorCode) {
                errorCode = "\(integerErrorCode)"
            }
        }
        message = try? values.decodeIfPresent(String.self, forKey: .message)
        if message == nil {
            message = try? values.decodeIfPresent(String.self, forKey: .errorMessage)
        }
        path = try? values.decodeIfPresent(String.self, forKey: .path)
    }
}

enum ErrorTypes: String {
    case internetUnavailableError = "No Internet Available"
    case internetLostError = "Internet connection lost."
    case badRequestURLError = "Bad request url."
    case invalidRequestURL = "Invalid request url."
    case requestTimeOutError = "The Request timed out"
    case unknownError = "Something went wrong. Please try again."
    case invalidData = "Invalid Data"

    static func getErrorType(error: Error?) -> ErrorTypes {
        if let er = error as NSError? {
            if er.code == NSURLErrorNotConnectedToInternet {
                return .internetUnavailableError

            } else if er.code == NSURLErrorNetworkConnectionLost {
                return .internetLostError

            } else if er.code == NSURLErrorBadURL {
                return .badRequestURLError

            } else if er.code == NSURLErrorUnsupportedURL {
                return .invalidRequestURL

            } else if er.code == NSURLErrorTimedOut {
                return .requestTimeOutError
            }
        }

        return .unknownError
    }
}
