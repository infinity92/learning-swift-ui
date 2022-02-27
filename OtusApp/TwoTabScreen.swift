//
//  TwoTabScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

struct TwoTabScreen: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: Text("This is Option 1"),
                    isActive: $appViewModel.isNavigateActive,
                    label:  {
                        Text("Option 1");
                    })
                
                Text("Option 2");
                Text("Option 3");
            }
            .navigationTitle("List")
        }
    }
}

struct TwoTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        TwoTabScreen()
    }
}
