//
//  FriendsRepositoryProtocol.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
import DomainLayer

protocol FriendsDataToDomainMapperProtocol {
    
    func dataToDomainMapper() -> [FriendsListDomainModel]
}
