//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

public typealias FriendDomainResponse = Promise<FriendDetailDomainModel>
public typealias FriendsDomainResponse = Promise<[FriendsListDomainModel]>


public protocol FriendsRepositoryProtocol {
    func getFriends() -> FriendsDomainResponse
    func getFriendWith(friendId: String) -> FriendDomainResponse
}
