//
//  FriendsService.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import PromiseKit

/// Makes network call after preparing url
public final class FriendsService: FriendsServiceProtocol {

    private let network: NetworkManagerProtocol

    public init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    //Function to send network request
    public func makeNetworkRequest() -> FriendsResponse {
        
        let endPoint = DataConstants.ApiEndpoints.friendsApiUrl
        let url = URL(string: endPoint)
        guard let url = url else { return Promise.value([]) }
        let friendsResponse = network.request([FriendDataModel].self, endPoint: url)
        return friendsResponse
    }
}

