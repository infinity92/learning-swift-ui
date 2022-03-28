//
//  NewsListScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 28.03.2022.
//

import SwiftUI

struct NewsListScreen: View {

    var themeList = ["Apple", "Samsung", "Huawei"]
    var listHeight: Double = 800

    @State var listViewTypeChoice = 0
    @StateObject var newsViewModel: NewsViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack {
                Picker("Lists", selection: $listViewTypeChoice) {
                    ForEach(0..<themeList.count, id: \.self) { index in
                        Text(themeList[index])
                            .tag(index)
                    }
                }
                .onAppear(perform: {
                    loadNews()
                })
                .onChange(of: listViewTypeChoice) { _ in
                    loadNews()
                } // Picker
                .pickerStyle(SegmentedPickerStyle())
                .padding(.top, 30)
                
                list
                Spacer()
            }
            .frame(minHeight: listHeight)
        }
    }
    
    var list: some View {
        
        List(newsViewModel.articles) { article in
            NavPushButton(destination: NewsDetailScreen(article: article)) {
                NewsCell(title: article.title ?? "",
                                description: article.description ?? "")
            }
        }
    }
    
    func loadNews() {
        newsViewModel.fetchArticles(by: themeList[listViewTypeChoice])
    }
        
}
