//
//  DataProvider.swift
//  OtusApp
//
//  Created by Александр Котляров on 02.04.2022.
//

import Foundation
import NewsNetwork

class DataProvider {
    @Injected var articleService: IArtricleService?
    
    func requestArticle(
        q: String,
        from: String,
        sortBy: String,
        language: String,
        apiKey: String,
        page: Int? = nil,
        completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)
    ) {
        articleService?.request(
            q: q,
            from: from,
            sortBy: sortBy,
            language: language,
            apiKey: apiKey,
            page: page,
            completion: completion)
    }
}
