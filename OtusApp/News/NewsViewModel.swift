//
//  NewsViewModel.swift
//  OtusApp
//
//  Created by Александр Котляров on 19.03.2022.
//

import Foundation
import NewsNetwork

final class NewsViewModel: ObservableObject {
    
    @Published var articles: [Article] = .init()
    
    func fetchArticles(by theme: String) {
        self.articles = []
        ArticlesAPI.everythingGet(q: theme,
                                  from: "2022-03-01",
                                  sortBy: "publishedAt",
                                  language: "en",
                                  apiKey: "fcfe594b4b334e52a7cc24fb366c9caa") { list, error in
            debugPrint(error ?? "no error")
            self.articles = list?.articles ?? []
        }
    }
}

extension Article: Identifiable {
    public var id: String { url }
}
