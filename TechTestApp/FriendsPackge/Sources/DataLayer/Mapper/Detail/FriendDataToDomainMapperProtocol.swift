//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
import DomainLayer

protocol FriendDataToDomainMapperProtocol {
    
    func dataToDomainMapper() -> FriendDetailDomainModel
}
