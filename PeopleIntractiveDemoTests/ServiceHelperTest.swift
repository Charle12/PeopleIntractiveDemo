//
//  ServiceHelperTest.swift
//  PeopleIntractiveDemoTests
//
//  Created by Admin on 2/6/21.
//

import XCTest

@testable import PeopleIntractiveDemo

class ServiceHelperTests: XCTestCase {

    func testCancelRequest() {
        // giving a "previous" session
        ServiceHelper.shared.fetchUsers { (_) in
            // ignore call
        }
        // Expected to task nil after cancel
        ServiceHelper.shared.cancelFetchUsers()
        XCTAssertNil(ServiceHelper.shared.task, "Expected task nil")
    }

}

