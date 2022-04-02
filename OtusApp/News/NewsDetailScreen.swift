//
//  NewsDetailScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 28.03.2022.
//

import SwiftUI
import NewsNetwork

struct NewsDetailScreen: View {
    
    let article: Article
    var title: String {
        if let title = article.title, !title.isEmpty {
            return title
        } else {
            return article.description ?? "Unknown title"
        }
    }
    
    var body: some View {
        
        VStack {
            
            AsyncImage(url: URL(string: article.urlToImage ?? "")){ image in
                image.resizable()
            } placeholder: {
                ZStack {
                    Color.gray
                }
            }
            
            Text(title)
                .font(.title)
            HStack {
                Text(article.author ?? "Unknown author")
                Text(article.publishedAt ?? "0000-00-00")
            }
            .padding()
            Text(article.content ?? "Content is empty")
            NavPushButton(destination: NewsURLScreen(newsURL: article.url)) {
                Text("View URL")
                    .padding()
                    .background(Color.blue)
            }
            Spacer()
            HStack {
                NavPopButton(destination: .previous) {
                    Text("Back")
                        .padding()
                        .foregroundColor(Color.blue)
                }
                Spacer()
            }
        }
        .padding()
    }
}
