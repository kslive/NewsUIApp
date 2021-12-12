//
//  APIError.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknow
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Ошибка декодинга объекта из сервиса"
        case .errorCode(let code):
            return "\(code) - ошибка"
        case .unknow:
            return "Неизветная ошибка"
        }
    }
}
