//
//  NewsRo.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import Foundation

struct NewsRo: Codable {
    let articles: [ArticleRo]
}

struct ArticleRo: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, description: String
    let image: String
    let date: Date
    
    init(author: String?, url: String?, source: String, title: String, description: String, image: String, date: Date) {
        self.author = author
        self.url = url
        self.source = source
        self.title = title
        self.description = description
        self.image = image
        self.date = date
    }
}

extension ArticleRo {
    static var mock: Self {
        .init(author: "newsfeedback@fool.com (Howard Smith)",
              url: "https://www.fool.com/investing/2021/12/12/3-supercharged-ev-stocks-to-buy-in-2022-and-beyond/",
              source: "Reuters",
              title: "3 Supercharged Electric-Vehicle Stocks to Buy in 2022 and Beyond",
              description: "These three companies involve different risks, but each could supercharge your portfolio over the long term.",
              image: "https://www.reuters.com/resizer/ZvLLEpiT3mv7T6SqWiJiy0iOWaQ=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/C7GXCWVKSJKJ5KTCM6GKDYHPTI.jpg",
              date: .init())
    }
}
