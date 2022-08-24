//
//  DetailViewModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import DomainLayer

public final class FriendsDetailViewModel: ObservableObject, FriendsDetailViewModelProtocol {
    
    public var friendId: String = ""
    @Published public var friend: FriendDetailPresentationModel?
    @Published public var validUrl: Bool = false
    @Published public var errorMessage: String? = nil
      
    private let useCase: FriendsDetailUseCaseProtocol

    // MARK: - Initialise
    public init(friendId: String, useCase: FriendsDetailUseCaseProtocol) {
        self.friendId = friendId
        self.useCase = useCase
    }

    // MARK: - Method
    
    public func fetchFriendDetails() {
        useCase.getFriendDetailWith(friendId: friendId)
            .done(on: .main) { [weak self] model in
                self?.getData(model: model)
            }
            .catch(on: .main, policy: .allErrors) {[weak self] error in
                self?.errorMessage = error.localizedDescription
            }
    }
    
    private func getData(model: FriendDetailDomainModel) {
        
        friend = FriendPresentationModelMapper(domainModel: model).mapToPresentationModel()
    }
    
    public func validateUrl() {
        let htmlURL = friend?.htmlUrl ?? ""
        self.useCase.validateURL(for: htmlURL) { result in
            if result {
                validUrl = true
            } else {
                validUrl = false
            }
        }
    }
}
