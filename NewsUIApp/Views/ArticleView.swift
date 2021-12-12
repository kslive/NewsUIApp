//
//  ArticleView.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import SwiftUI
import URLImage
import URLImageStore

struct ArticleView: View {
    private let article: ArticleRo
    
    init(article: ArticleRo) {
        self.article = article
    }
    
    var body: some View {
        HStack {
            if let imgUrl = article.image, let url = URL(string: imgUrl) {
                URLImage(url,
                         failure: { _, _ in
                    errorImageBody
                },
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                })
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
            } else {
                errorImageBody
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title)
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                
                Text(article.source)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
    
    private var errorImageBody: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: .mock)
            .previewLayout(.sizeThatFits)
    }
}
