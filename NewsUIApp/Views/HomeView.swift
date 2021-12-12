//
//  HomeView.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import SwiftUI

struct HomeView: View {
     @StateObject private var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
                
            case .failed(let error):
                ErrorView(error: error) {
                    viewModel.getArticles()
                }
                
            case .content(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                    }
                    
                    .navigationTitle("Новости")
                }
            }
            
        }
        .onAppear {
            viewModel.getArticles()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
