//
//  APIEndPoint.swift
//  GistSwiftpackageManager
//
//  Created by andre mietti on 25/04/25.
//

import Foundation
import Networking
import ObjectiveC

public var parametersKey: [String: String]?

enum APIEndPoint {
    case publicGists
}

extension APIEndPoint: EndPoint {
    
    var host: String {
        return "api.github.com"
    }
    
    var scheme: String {
        return "https"
    }
    
    var path: String {
        switch self {
        case .publicGists:
            return "/gists/public"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .publicGists:
            return .get
        }
    }
    
    var header: [String : String]? {
        let headers = [
            "Accept": "application/vnd.github+json",
            "X-GitHub-Api-Version": "2022-11-28"
        ]
        return headers
    }
    
    var body: [String : String]? {
        return nil
    }
    
    var parameters: [String: String]? {
        return parametersKey
    }
        
    public mutating func setParam(params: [String: String]) {
        parametersKey = params
    }
}

extension NetworkError: @retroactive CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        default:
            return "Unknown Error"
        }
    }
}
