//
//  Friend.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public struct FriendsListPresentationModel : Identifiable {
    public let id = UUID() 
    var friendId: String
    var nickname: String
    var avatarUrl: String?
}
