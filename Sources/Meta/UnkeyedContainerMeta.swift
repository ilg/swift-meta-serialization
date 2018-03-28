//
//  UnkeyedContainerMeta.swift
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

public protocol UnkeyedContainerMeta: EncodingUnkeyedContainerMeta, DecodingUnkeyedContainerMeta {}

extension UnkeyedContainerMeta {
    
    public var countIfKnown: Int? {
        return count
    }
    
}

public protocol EncodingUnkeyedContainerMeta: Meta {
    
    /// The number of elements in the container ( 0 if no element is contained).
    var count: Int { get }
    
    /**
     Returns the element at the given index
     or nil, if the index is smaller than 0 or bigger or equal than count.
     */
    func get(at index: Int) -> Meta?
    
    /**
     Inserts or appends the given meta at index.
     Index may be equals count (in this case you should append), but not larger.
     */
    func insert(element: Meta, at: Int)
    
}

public protocol DecodingUnkeyedContainerMeta: Meta {
    
    /**
     The number of elements in the container, if this number is known.
     
     Returns nil, if the number is unknown.
     */
    var countIfKnown: Int? { get }
    
    /**
     Returns the element at the given index
     or nil, if the index is smaller than 0 or bigger or equal than count.
     */
    func get(at index: Int) -> Meta?
    
    /**
     Inserts or appends the given meta at index.
     Index may be equals count (in this case you should append), but not larger.
     */
    func insert(element: Meta, at: Int)
    
}