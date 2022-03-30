//
//  NewsListScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 28.03.2022.
//

import SwiftUI

struct NewsListScreen: View {

    var listHeight: Double = 800

    @State var listViewTypeChoice: ThemeList = .apple
    
    @ObservedObject var appleNews = NewsViewModel(theme: .apple)
    @ObservedObject var samsungNews = NewsViewModel(theme: .samsung)
    @ObservedObject var huaweiNews = NewsViewModel(theme: .huawei)
    
    var body: some View {
        ScrollView {
            VStack {
                Picker("Lists", selection: $listViewTypeChoice) {
                    ForEach(ThemeList.allCases, id: \.self) { theme in
                        Text(theme.getTitle())
                            .tag(theme)
                    }
                }
                .onAppear(perform: {
                    if getCurrentSourceNews().articles.isEmpty {
                        getCurrentSourceNews().fetchArticles()
                    }
                })
                .onChange(of: listViewTypeChoice) { _ in
                    if getCurrentSourceNews().articles.isEmpty {
                        getCurrentSourceNews().fetchArticles()
                    }
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
        
        List(getCurrentSourceNews().articles) { article in
            NavPushButton(destination: NewsDetailScreen(article: article)) {
                NewsCell(title: article.title ?? "",
                                description: article.description ?? "")
                .onAppear {
                    if article == getCurrentSourceNews().articles.last {
                        getCurrentSourceNews().fetchArticles()
                    }
                }
            }
        }
    }
       
    func getCurrentSourceNews() -> NewsViewModel {
        switch listViewTypeChoice {
        case .apple:
            return appleNews
        case .samsung:
            return samsungNews
        case .huawei:
            return huaweiNews
        }
    }
}
