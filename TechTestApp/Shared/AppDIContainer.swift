//
//  AppDIContainer.swift
//  TechTestApp (iOS)
//
//  Created by Ranjit Singh on 23/08/22.
//

import PresentationLayer
import DomainLayer
import DataLayer

final class AppDIContainer {
    
    //Create friends list view and injecting view model
    public static func createFriendsListView() -> FriendsListView {
        
        return FriendsListView(viewModel: createFriendsListViewModel())
    }

    //Create friends list view and injecting use case layer
    private static func createFriendsListViewModel() -> FriendsListViewModel {
        let viewModel = FriendsListViewModel(useCase: createFriendsListUsecase())
        return viewModel
    }
    
    //Create use and injecting repository layer
    private static func createFriendsListUsecase() -> FriendsListUseCaseProtocol {
        createFriendsRepository()
        return DomainLayer.createFriendsListUsecase()
    }
    
    //Create and inject repository to domain layer
    private static func createFriendsRepository() {
        let repository = FriendsRepository(dataStore: createFriendsDataStore())
        DomainLayer.repository = repository
    }
    
    //Create data store and inject service layer
    private static func createFriendsDataStore() -> FriendsDataStore {
        FriendsDataStore(service: createFriendsService(), cacheManager: createCacheManager())
    }
    
    //Create service and inject network
    private static func createFriendsService() -> FriendsService {
        return FriendsService(network: createNetwork())
    }
    
    private static func createNetwork() -> NetworkManger {
        return NetworkManger()
    }
    
    private static func createCacheManager() -> CacheManager {
        return CacheManager()
    }
}
