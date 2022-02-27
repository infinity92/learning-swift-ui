//
//  Text.swift
//  OtusApp
//
//  Created by Александр Котляров on 27.02.2022.
//

import SwiftUI
import UIKit

struct LableView: UIViewRepresentable {
    @State var text: String?

    func makeUIView(context: Context) -> UILabel {
        UILabel()
    }

    func updateUIView(_ lable: UILabel, context: Context) {
        lable.text = text
    }
}
