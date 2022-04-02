//
//  NewsViewModel.swift
//  OtusApp
//
//  Created by Александр Котляров on 19.03.2022.
//

import Foundation
import NewsNetwork

enum ThemeList: CaseIterable {
    case apple
    case samsung
    case huawei
    
    func getTitle() -> String {
        switch self {
        case .apple:
            return "Apple"
        case .samsung:
            return "Samsung"
        case .huawei:
            return "Huawei"
        }
    }
    
    func getNewsQuery() -> String {
        switch self {
        case .apple:
            return "Apple"
        case .samsung:
            return "Samsung"
        case .huawei:
            return "Huawei"
        }
        
    }
}


class NewsViewModel: ObservableObject {
    
    @Published var articles: [Article] = .init()
    
    private let dataProvider = DataProvider()
    private var canLoad: Bool = true
    private var page = 1
    private var query: String
    private var nowDate: String {
        let f = DateFormatter()
        f.dateFormat = "yyy-MM-dd"
        return f.string(from: Date())
    }
    
    init(theme: ThemeList) {
        self.query = theme.getNewsQuery()
    }
    
    func fetchArticles() {
        guard canLoad else { return }
        canLoad = false

        dataProvider.requestArticle(q: query, 
                                    from: nowDate,
                                  sortBy: "publishedAt",
                                  language: "en",
                                  apiKey: "fcfe594b4b334e52a7cc24fb366c9caa",
                                  page: page) { list, error in
            
            if error == nil {
                print("success thrme: \(self.query), page: \(self.page)")
                self.articles.append(contentsOf: list?.articles ?? [])
                self.page += 1
            } else {
                debugPrint(error ?? "no error")
            }
            
            self.canLoad = true
        }
    }
}
