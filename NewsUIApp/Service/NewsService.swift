//
//  NewsService.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsRo, APIError>
}

struct NewsServiceImpl: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsRo, APIError> {
        URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknow }
            .flatMap { data, response -> AnyPublisher<NewsRo, APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknow)
                        .eraseToAnyPublisher()
                }
                
                switch response.statusCode {
                case 200...299:
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                    
                    return Just(data)
                        .decode(type: NewsRo.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                default:
                    return Fail(error: APIError.errorCode(response.statusCode))
                        .eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher() 
    }
}
