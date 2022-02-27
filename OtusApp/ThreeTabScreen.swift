//
//  ThreeTabScreen.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI

struct ThreeTabScreen: View {
    
    @State var isShowModal = false
    
    var body: some View {
        Button {
            isShowModal.toggle()
        } label: {
            Text("Show modal")
                .padding()
        }
        .sheet(isPresented: $isShowModal) {
            VStack {
                Text("This is modal")
                Button {
                    isShowModal = false
                } label: {
                    Text("Close modal")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                }
            }
        }
    }
}

struct ThreeTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThreeTabScreen()
    }
}
