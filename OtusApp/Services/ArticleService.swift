//
//  ArticleService.swift
//  OtusApp
//
//  Created by Александр Котляров on 02.04.2022.
//

import Foundation
import NewsNetwork

protocol IArtricleService: AnyObject {
    func request(
        q: String,
        from: String,
        sortBy: String,
        language: String,
        apiKey: String,
        page: Int?,
        completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)
    )
}

class ArtricleService: IArtricleService {
    func request(
        q: String,
        from: String,
        sortBy: String,
        language: String,
        apiKey: String,
        page: Int? = nil,
        completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)
    ) {
        ArticlesAPI.everythingGet(
              q: q,
              from: from,
              sortBy: sortBy,
              language: language,
              apiKey: apiKey,
              page: page,
              completion: completion
        )
    }
}
