//
//  MockFriendsData.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
@testable import DataLayer

struct MockFriendDetailData {

    static let friend: FriendDataModel? =
        FriendDataModel(id: 123, login: "Test", avatarUrl: "https://avatars.githubusercontent.com/u/137?v=4", username: "Test User name", htmlUrl: "https://avatars.githubusercontent.com/u/137?v=4")
}
