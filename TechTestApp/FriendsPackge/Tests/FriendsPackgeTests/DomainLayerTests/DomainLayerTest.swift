//
//  DomainLayerTest.swift
//  
//
//  Created by Ranjit Singh on 24/08/22.
//

import XCTest
@testable import DomainLayer

class DomainLayerTest: XCTestCase {

    let repository = MockFriendsRepository()

    override func setUpWithError() throws {
    
    }
    
    override func tearDownWithError() throws {
        
    }

    func testDomainLayer_FriendsListUsecaseCreation() {
        let expecatation = expectation(description: "Success")

        DomainLayer.repository = repository
        if DomainLayer.createFriendsListUsecase() is FriendsListUseCase {
            expecatation.fulfill()
        }
        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testDomainLayer_FriendDetailUsecaseCreation() {
        let expecatation = expectation(description: "Success")

        DomainLayer.repository = repository
        if DomainLayer.createFriendsDetailUseCase() is FriendsDetailUseCase {
            expecatation.fulfill()
        }
        wait(for: [expecatation], timeout: 1.0)
    }
}
