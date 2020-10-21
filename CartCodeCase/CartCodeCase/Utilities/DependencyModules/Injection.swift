//
//  Injection.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

@propertyWrapper
struct Inject<Component>{
    
    var component: Component
    
    init(){
        self.component = Resolver.shared.resolve(Component.self)
    }
    
    public var wrappedValue:Component{
        get { return component}
        mutating set { component = newValue }
    }
    
}
