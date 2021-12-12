//
//  ErrorView.swift
//  NewsUIApp
//
//  Created by Eugene Kiselev on 12.12.2021.
//

import SwiftUI

struct ErrorView: View {
    typealias ErrorViewActionHandler = () -> Void
    
    private let error: Error
    private let errorHandler: ErrorViewActionHandler
    
    init(error: Error, errorHandler: @escaping ErrorViewActionHandler) {
        self.error = error
        self.errorHandler = errorHandler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            
            Text("Упс")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            
            Button {
                errorHandler()
            } label: {
                Text("Повторить")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
