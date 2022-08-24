//
//  Friend.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public struct FriendsListDomainModel {
    public var friendId: String
    public var nickname: String
    public var avatarUrl: String?
    
    public init(friendId: String, nickname: String, avatarUrl: String?) {
        
        self.friendId = friendId
        self.nickname = nickname
        self.avatarUrl = avatarUrl
    }
}
