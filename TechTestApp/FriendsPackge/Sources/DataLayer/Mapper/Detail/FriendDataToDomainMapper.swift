//
//  DataToDomainMapper.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import DomainLayer

class FriendDataToDomainMapper: FriendDataToDomainMapperProtocol {
    
    private var friendDataModel: FriendDataModel

    init(dataModel: FriendDataModel) {
        self.friendDataModel = dataModel
    }
    
    func dataToDomainMapper() -> FriendDetailDomainModel {
        
        let friendDomainModel = FriendDetailDomainModel(friendId: String(friendDataModel.id),
                                                        nickname: friendDataModel.login,
                                                        avatarUrl: friendDataModel.avatarUrl, username: friendDataModel.username, htmlUrl: friendDataModel.htmlUrl)
        return friendDomainModel
    }
}
