//
//  ContainerMetas.swift
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

/**
 A meta for a keyed collection of metas.
 
 The key is always a CodingKey. How these keys are handled internal is left to the implementor.
 */
public protocol KeyedContainerMeta: Meta {
    
    /**
     Access the value inside this container for key.
     
     Return nil, if there's no value contained for this key.
     
     You may not return nil, if contains returned true for the key.
     */
    subscript(key: CodingKey) -> Meta? { get set }
    
    /**
     Returns all keys in this container as a certain CodingKey implementation.
     
     Internal key representations, that could not be converted to the given kind of CodingKey may be ommited from the returned collection, if you can safely assume, that your representation fully identifies a CodingKey.
     */
    func allKeys<Key>() -> [Key] where Key: CodingKey
    /// returns whether key is contained in this container
    func contains(key: CodingKey) -> Bool
    
}

/**
 A meta for a unkeyed collection of metas.
 
 The indexation starts at 0 and ends at count-1, with steps of size 1 (if you have 4 elements, they have to be indexed 0,1,2,3).
 */
public protocol UnkeyedContainerMeta: Meta {
    
    /**
     The number of elements in the container, return 0, if no element is contained.
     
     Return nil, if the number is unknown.
     You may not return nil during encoding.
    */
    var count: Int? { get }
    
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
