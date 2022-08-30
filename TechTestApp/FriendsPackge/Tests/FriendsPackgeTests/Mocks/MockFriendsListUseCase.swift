//
//  MockFriendsUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
@testable import DomainLayer

class MockFriendsListUseCase: FriendsListUseCaseProtocol {

    var friend: [FriendsListDomainModel]?
    var error: Error?

    func getFriends() -> Any {
        return Promise<Any> { seal in
            if let error = error {
                seal.reject(error)
            } else {
                if let friend = friend {
                    seal.fulfill(friend)
                }
            }
        }
    }
}
