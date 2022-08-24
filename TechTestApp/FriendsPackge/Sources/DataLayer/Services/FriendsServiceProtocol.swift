//
//  FriendsServiceProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

public typealias FriendResponse = Promise<FriendDataModel>
public typealias FriendsResponse = Promise<[FriendDataModel]>

public protocol FriendsServiceProtocol {
    func makeNetworkRequest() -> FriendsResponse
}
