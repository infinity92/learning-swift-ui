//
//  TwoTabScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

struct ListScreen: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            NewsList()
            Spacer()
        }
    }
}

struct NewsList: View {

    var themeList = ["Apple", "Samsung", "Huawei"]
    var listHeight: Double = 800

    @State var listViewTypeChoice = 0
    @StateObject var newsViewModel: NewsViewModel = .init()
    
    var body: some View {
        ScrollView {
            VStack {
                Picker("Lists", selection: $listViewTypeChoice) {
                    ForEach(0..<themeList.count) { index in
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
            ListArticleCell(title: article.title ?? "",
                            description: article.description ?? "")
        }
    }
    
    func loadNews() {
        newsViewModel.fetchArticles(by: themeList[listViewTypeChoice])
    }
        
}

struct ListArticleCell: View {
    
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
            VStack {
                Text(title.isEmpty ? description : title)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
    }
    
}

struct TwoTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
