//
//  Configurator.swift
//  OtusApp
//
//  Created by Александр Котляров on 02.04.2022.
//

import Foundation
import NewsNetwork

class Configurator {
    static let shared = Configurator()
    
    private init() {}
    
    func register() {
        ServiceLocator.shared.add(service: ArtricleService() as IArtricleService)
    }
}
