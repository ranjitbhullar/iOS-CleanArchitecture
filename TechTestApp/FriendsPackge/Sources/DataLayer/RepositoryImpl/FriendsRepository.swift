//
//  FriendsRepository.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit
import DomainLayer

public typealias FriendDomainResponse = Promise<FriendDetailDomainModel>
public typealias FriendsDomainResponse = Promise<[FriendsListDomainModel]>

public final class FriendsRepository: FriendsRepositoryProtocol {
    
    private let dataStore: FriendsDataStoreProtocol
    public init(dataStore: FriendsDataStoreProtocol) {
        self.dataStore = dataStore
    }
    
    
    public func getFriendWith(friendId: String) -> Any {
        return Promise<Any> { seal in
            dataStore.fetchFriendWith(friendId: friendId).done { friendData in
                let mapper = FriendDataToDomainMapper(dataModel: friendData)
                seal.fulfill(mapper.dataToDomainMapper())
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
    
    public func getFriends() -> Any {
        return Promise<Any> { seal in
            dataStore.fetchFriendsData().done { dataModel in
                let mapper = FriendsDataToDomainMapper(dataModel: dataModel)
                seal.fulfill(mapper.dataToDomainMapper())
            }
            .catch(on: .main, policy: .allErrors) { error in
                seal.reject(error)
            }
        }
    }
}
