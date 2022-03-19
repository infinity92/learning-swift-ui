//
//  ContentView.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

final class AppViewModel: ObservableObject {
    
    @Published var selection = 1
    @Published var isNavigateActive = false
    
}

struct ContentView: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        TabView(selection: $appViewModel.selection) {
            OneTabScreen()
                .tabItem {
                    Image(systemName: "square.and.arrow.up")
                    Text("Link")
                }
                .tag(0)
            ListScreen()
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
