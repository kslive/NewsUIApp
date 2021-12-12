//
//  NewsViewModel.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    @Published private(set) var state: ResultState = .loading
    
    private let service: NewsService
    
    private(set) var articles: [ArticleRo] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case .finished:
                    self.state = .content(self.articles)
                    
                case .failure(let error):
                    self.state = .failed(error: error)
                }
                
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        cancellables.insert(cancellable)
    }
}
