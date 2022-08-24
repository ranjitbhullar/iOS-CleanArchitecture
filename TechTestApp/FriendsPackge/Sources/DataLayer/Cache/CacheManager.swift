//
//  CacheManager.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

let dataCache = NSCache<NSString, AnyObject>()

public class CacheManager: CacheManagerProtocol {
    
    public init() { }
    
    public func objectForKey(key: String) -> AnyObject? {
        
        return dataCache.object(forKey: NSString(string: key))
    }
    
    public func setObjectForKey(object: AnyObject, key: String) {
        
        dataCache.setObject(object, forKey: NSString(string: key))
    }
    
    public func clearCacheForKey(key: String) {
        
        dataCache.removeObject(forKey: NSString(string: key))
    }
    
    public func clearAllCache() {
        
        dataCache.removeAllObjects()
    }
}
