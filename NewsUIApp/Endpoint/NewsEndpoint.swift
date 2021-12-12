//
//  NewsEndpoint.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    var urlRequest: URLRequest {
        .init(url: baseUrl.appendingPathComponent(path))
    }
    
    var baseUrl: URL {
        switch self {
        case .getNews:
            return .init(string: "https://api.lil.software") ?? .init(fileURLWithPath: "")
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return "/news"
        }
    }
}
