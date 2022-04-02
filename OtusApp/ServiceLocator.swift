//
//  ServiceLocator.swift
//  OtusApp
//
//  Created by Александр Котляров on 02.04.2022.
//

import Foundation

class ServiceLocator {
    static let shared = ServiceLocator()
    
    private init() {}
    
    private var services: [String:Any] = [String:Any]()
    
    func add<T:Any>(service: T) {
        let key = String(describing: T.self)
        if services[key] == nil {
            services[key] = service
        }
    }
    
    func get<T:Any>(type: T.Type)->T? {
        let key = String(describing: type)
        return services[key] as? T
    }
}
