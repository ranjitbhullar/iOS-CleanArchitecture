//
//  CacheManagerProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public protocol CacheManagerProtocol {
    func objectForKey(key: String) -> AnyObject?
    func setObjectForKey(object: AnyObject, key: String)
    func clearCacheForKey(key: String)
    func clearAllCache()
}
