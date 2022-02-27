//
//  OneTabScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

struct OneTabScreen: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        Button {
            appViewModel.selection = 1
            appViewModel.isNavigateActive = true
        } label: {
            Text("Navigate")
                .padding()
        }
    }
}

struct OneTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        OneTabScreen()
    }
}
