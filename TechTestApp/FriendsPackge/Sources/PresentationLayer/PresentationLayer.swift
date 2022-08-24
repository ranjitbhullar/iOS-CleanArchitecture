import DomainLayer
public struct PresentationLayer {
    
    public init() {    }
    
    public static func createFriendDetailView(friendId: String) -> FriendDetailView {
        return FriendDetailView(viewModel: createFriendDetailViewModel(friendId: friendId))
    }

    public static func createFriendDetailViewModel(friendId: String) -> FriendsDetailViewModel {
        let viewModel = FriendsDetailViewModel(friendId: friendId, useCase: DomainLayer.createFriendsDetailUseCase())
        return viewModel
    }
}
