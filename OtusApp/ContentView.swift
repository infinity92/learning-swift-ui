//
//  ContentView.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            OneTabScreen()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("Link")
                }
                .tag(0)
            TwoTabScreen()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
                .tag(1)
            ThreeTabScreen()
                .tabItem {
                    Image(systemName: "macwindow")
                    Text("Modal")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
