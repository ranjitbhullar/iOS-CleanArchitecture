//
//  FriendsRepositoryTest.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest
import PromiseKit
@testable import DomainLayer
@testable import DataLayer

class FriendsRepositoryTest: XCTestCase {

    var friendsRepository: FriendsRepository?
    let mockDataStore = MockFriendsDataStore()

    override func setUpWithError() throws {
        friendsRepository = FriendsRepository(dataStore: mockDataStore)
    }
    
    override func tearDownWithError() throws {
        friendsRepository = nil
    }
    
    func testRepositoryWithFriendDetails_Success() {
        let expecatation = expectation(description: "Success")
        mockDataStore.friend = MockFriendDetailData.friend
        guard let friendsRepository = friendsRepository else { return }
        (friendsRepository.getFriendWith(friendId: "123") as! Promise<Any>)
            .done { model in
                if !(model as! FriendDetailDomainModel).friendId.isEmpty {
                    expecatation.fulfill()
                }
                else {
                    XCTFail("Failure not expected in this case")
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
    
    func testRepositoryWithFriendDetail_Failure() {
        let expecatation = expectation(description: "Failure")
        mockDataStore.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   "Failed error"])
        guard let friendsRepository = friendsRepository else { return }
        (friendsRepository.getFriendWith(friendId: "123") as! Promise<Any>)
            .catch {error in
                XCTAssertTrue(error.localizedDescription == "Failed error")
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepository_Success() {
        let expecatation = expectation(description: "Success")
        mockDataStore.friends = MockFriendsData.friend
        guard let friendsRepository = friendsRepository else { return }
        (friendsRepository.getFriends() as! Promise<Any>)
            .done { model in
                let friendsCount = (model as! [FriendsListDomainModel]).count
                if friendsCount >= 1 {
                    expecatation.fulfill()
                }
            }
            .catch { _ in
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }

    func testRepository_Failure() {
        let expecatation = expectation(description: "Failure")
        mockDataStore.error = NSError(domain: "com.test.error", code: 0, userInfo: [NSLocalizedDescriptionKey:   "Failed error"])
        guard let friendsRepository = friendsRepository else { return }
        (friendsRepository.getFriends() as! Promise<Any>)
            .catch {error in
                XCTAssertTrue(error.localizedDescription == "Failed error")
                expecatation.fulfill()
            }

        wait(for: [expecatation], timeout: 1.0)
    }
}
