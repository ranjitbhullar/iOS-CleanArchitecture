//
//  DetailUseCaseProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

public protocol FriendsDetailUseCaseProtocol {
    func validateURL(for htmlString: String, completion: (Bool) -> ())
    func getFriendDetailWith(friendId: String) -> Any
}
