//
//  InjectedWrapper.swift
//  OtusApp
//
//  Created by Александр Котляров on 02.04.2022.
//

import Foundation
import SwiftUI

@propertyWrapper
struct Injected<T> {
    private var service: T?
    private weak var serviceLocator = ServiceLocator.shared
    
    public var wrappedValue: T? {
        mutating get {
            if service == nil {
                service =  serviceLocator?.get(type: T.self)
            }
            return service
        }
        mutating set {
            service = newValue
        }
    }
    
    public var projectedValue:Injected<T> {
        get {return self}
        mutating set {self = newValue}
    }
}
