//
//  Friend.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public struct FriendDetailDomainModel {
    public var friendId: String
    public var nickname: String
    public var avatarUrl: String?
    public var username: String
    public var htmlUrl: String?
    
    public init(friendId: String, nickname: String, avatarUrl: String?, username: String, htmlUrl: String?) {
        self.friendId = friendId
        self.nickname = nickname
        self.avatarUrl = avatarUrl
        self.username = username
        self.htmlUrl = htmlUrl
    }
}
