//
//  OtusAppApp.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

@main
struct OtusAppApp: App {
    
    init() {
        Configurator.shared.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppViewModel())
        }
    }
}
