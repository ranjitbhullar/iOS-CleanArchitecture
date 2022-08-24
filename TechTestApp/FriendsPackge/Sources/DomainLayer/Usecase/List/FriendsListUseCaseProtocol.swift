//
//  FriendsUseCaseProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

public protocol FriendsListUseCaseProtocol {
    func getFriends() -> FriendsDomainResponse
}
