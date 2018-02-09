//
//  WrapInStringMeta.swift
//  meta-serialization
//
//  Created by cherrywoods on 26.10.17.
//  Licensed under Unlicense, https://unlicense.org
//  See the LICENSE file in this project
//

import Foundation

public extension WrappingMeta where WrapperType == String, WrappedType: LosslessStringConvertible {
    
    public func convert(wrapped: WrappedType) -> WrapperType {
        return wrapped.description
    }
    
    public func convert(wrapper string: WrapperType) -> WrappedType? {
        return WrappedType.init(string)!
    }
    
}
