//
//  Example2Serialization.swift
//  MetaSerialization
//  
//  Copyright 2018 cherrywoods
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
// 

import Foundation
@testable import MetaSerialization

struct Example2Serialization: Serialization {
    
    typealias Raw = [Meta]
    
    // MARK: decoding
    
    func provideNewDecoder() -> MetaDecoder {
        
        return MetaDecoder(unwrapper: Example2.translator, storage: CodingDictionary())
        
    }
    
    func convert(raw: [Meta]) throws -> Meta {
        
        return raw
        
    }
    
    // MARK: encoding
    
    func provideNewEncoder() -> MetaEncoder {
        return MetaEncoder(metaSupplier: Example2.translator, storage: CodingDictionary())
    }
    
    func convert(meta: Meta) throws -> [Meta] {
        
        guard let container = meta as? Example2EncodingContainerMeta else {
            throw Errors.notAllowedFirstLevelNonContainer
        }
        
        return container.array
        
    }
    
    enum Errors: Error {
        case notAllowedFirstLevelNonContainer
    }
    
}
