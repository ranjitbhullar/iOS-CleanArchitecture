//
//  FriendsViewModel.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation
import DomainLayer
import PromiseKit

public final class FriendsListViewModel: ObservableObject, FriendsListViewModelProtocol {
    
    @Published public var friends = [FriendsListPresentationModel]()
    @Published public var errorMessage: String? = nil
    
    private let useCase: FriendsListUseCaseProtocol

    public init(useCase: FriendsListUseCaseProtocol) {
        self.useCase = useCase
    }
    
    public func fetchFriends() {
        (useCase.getFriends() as! Promise<Any>)
            .done(on: .main) { [weak self] model in
                self?.getData(model: model as! [FriendsListDomainModel])
            }
            .catch(on: .main, policy: .allErrors) {[weak self] error in
                self?.errorMessage = error.localizedDescription
            }
    }

    private func getData(model: [FriendsListDomainModel]) {
        friends = FriendsPresentationModelMapper(domainModel: model).mapToPresentationModel()
    }
}
