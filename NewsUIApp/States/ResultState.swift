//
//  ResultState.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import Foundation

enum ResultState {
    case loading
    case content([ArticleRo]) // use generic
    case failed(error: Error)
}
