//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public protocol FriendsRepositoryProtocol {
    func getFriends() -> Any
    func getFriendWith(friendId: String) -> Any
}
