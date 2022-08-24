import Foundation
public struct DomainLayer {
    
    public static var repository: FriendsRepositoryProtocol?
    public init() { }
    
    public static func createFriendsListUsecase() -> FriendsListUseCaseProtocol {
        return FriendsListUseCase(repository:self.repository!)
    }
    
    public static func createFriendsDetailUseCase() -> FriendsDetailUseCaseProtocol {
       
        let useCase = FriendsDetailUseCase(repository: self.repository!)
        return useCase
    }
}
