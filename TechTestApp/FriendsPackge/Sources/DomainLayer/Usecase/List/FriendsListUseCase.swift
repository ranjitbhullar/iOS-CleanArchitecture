//
//  FriendsUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

public class FriendsListUseCase: FriendsListUseCaseProtocol {

    let repository: FriendsRepositoryProtocol

    public init(repository: FriendsRepositoryProtocol) {
        self.repository = repository
    }
        
    public func getFriends() -> FriendsDomainResponse {
        return repository.getFriends()
    }
}
