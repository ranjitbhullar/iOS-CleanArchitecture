//
//  FriendsUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public class FriendsListUseCase: FriendsListUseCaseProtocol {

    let repository: FriendsRepositoryProtocol

    public init(repository: FriendsRepositoryProtocol) {
        self.repository = repository
    }
        
    public func getFriends() -> Any {
        return repository.getFriends()
    }
}
