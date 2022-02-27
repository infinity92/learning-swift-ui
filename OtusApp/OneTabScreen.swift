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
        
        VStack {
            LableView(text: "This Lable use UIViewRepresentable")
                .frame(minWidth: 0, maxWidth: 0, minHeight: 0, maxHeight: 0)
                .padding()
                
            
            Button {
                appViewModel.selection = 1
                appViewModel.isNavigateActive = true
            } label: {
                Text("Navigate")
                    .padding()
            }
        }
    }
}

struct OneTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        OneTabScreen()
.previewInterfaceOrientation(.portrait)
    }
}
