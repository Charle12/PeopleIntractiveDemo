//
//  UserViewModelTest.swift
//  PeopleIntractiveDemoTests
//
//  Created by Admin on 2/6/21.
//

import XCTest

@testable import PeopleIntractiveDemo

class UserViewModelTest: XCTestCase {
    
    var viewModel : UserViewModel!
    var dataSource : GenericDataSource<UserCellViewModel>!
    fileprivate var service : MockServiceHelper!
    var viewModelWithUsers : UserViewModel!
    fileprivate var serviceWithUser : MockServiceHelperWithUser!

    
    override func setUp() {
        super.setUp()
        self.service = MockServiceHelper()
        self.serviceWithUser = MockServiceHelperWithUser()
        self.dataSource = GenericDataSource<UserCellViewModel>()
        self.viewModel = UserViewModel(service: service, dataSource: dataSource)
        self.viewModelWithUsers = UserViewModel(service: serviceWithUser, dataSource: dataSource)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }
    
    func testFetchWithNoService() {
        // giving no service to a view model
        viewModel.service = nil
        // expected to not be able to fetch user
        viewModel.fetchUsers{ result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchUsers() {
        // expected completion to succeed
        viewModelWithUsers.fetchUsers { result in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }
    
    func testFetchNoUsers() {
        // expected completion to fail
        viewModel.fetchUsers { result in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch ")
            default:
                break
            }
        }
    }
}

fileprivate class MockServiceHelper : ServiceHelperProtocol {
    
    var userData: UsersData?
    func fetchUsers(_ completion: @escaping ((Result<UsersData, ErrorResult>) -> Void)) {
        if let userData = userData {
            completion(Result.success(userData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No NewsData")))
        }
    }
}

fileprivate class MockServiceHelperWithUser : ServiceHelperProtocol {
    var userData: UsersData? = UsersData(users: [User(userDict: ["title":"Dummy User"])!])
    func fetchUsers(_ completion: @escaping ((Result<UsersData, ErrorResult>) -> Void)) {
        if let userData = userData {
            completion(Result.success(userData))
        } else {
            completion(Result.failure(ErrorResult.custom(string: "No NewsData")))
        }
    }
}

