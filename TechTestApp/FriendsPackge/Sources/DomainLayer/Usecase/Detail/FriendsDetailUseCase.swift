//
//  DetailUseCase.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public class FriendsDetailUseCase: FriendsDetailUseCaseProtocol {    
    
    private let repository: FriendsRepositoryProtocol

    public init(repository: FriendsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func getFriendDetailWith(friendId: String) -> FriendDomainResponse {
        return repository.getFriendWith(friendId: friendId)
    }
    
    public func validateURL(for htmlString: String, completion: (Bool) -> ()) {
        if htmlString.isEmpty {
            completion(false)
        } else {
            completion(true)
        }
    }
}
