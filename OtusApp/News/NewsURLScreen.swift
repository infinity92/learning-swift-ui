//
//  NewsURLScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 28.03.2022.
//

import SwiftUI

struct NewsURLScreen: View {
    
    let newsURL: String
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(newsURL)
            Spacer()
            
            HStack {
                NavPopButton(destination: .previous) {
                    Text("Back")
                        .padding()
                        .foregroundColor(Color.blue)
                }
                Spacer()
                NavPopButton(destination: .root) {
                    Text("To Root")
                        .padding()
                        .foregroundColor(Color.blue)
                }
            }
        }
        .padding()
    }
}
