//
//  ArticleCell.swift
//  OtusApp
//
//  Created by Александр Котляров on 28.03.2022.
//

import SwiftUI

struct NewsCell: View {
    
    var title: String
    var imageUrl: String?
    var description: String
    
    let cornerRadius: CGFloat = 20
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundColor(.white)
                .shadow(radius: 10)
            VStack {
                AsyncImage(url: URL(string: imageUrl ?? "")){ image in
                    image.resizable()
                } placeholder: {
                    ZStack {
                        Color.gray
                        Text("No image")
                            .foregroundColor(.white)
                    }
                }
                .cornerRadius(cornerRadius, corners: [.topLeft, .topRight])
                
                
                Text(title.isEmpty ? description : title)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
    }
    
}
