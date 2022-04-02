//
//  Article+Identifable.swift
//  OtusApp
//
//  Created by Александр Котляров on 29.03.2022.
//

import SwiftUI
import NewsNetwork

extension Article: Identifiable {
    public var id: String { url }
}

