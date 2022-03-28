//
//  TwoTabScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI
import NewsNetwork

struct ListScreen: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        VStack {
            NavControllerView(transition: .none) {
                NewsListScreen()
            }
            Spacer()
        }
    }
}

struct TwoTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListScreen()
    }
}
