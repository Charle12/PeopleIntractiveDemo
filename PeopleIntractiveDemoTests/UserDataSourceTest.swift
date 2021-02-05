//
//  UserDataSourceTest.swift
//  PeopleIntractiveDemoTests
//
//  Created by Admin on 2/5/21.
//

import XCTest

@testable import PeopleIntractiveDemo

class UserDataSourceTest: XCTestCase {
    
    var dataSource : UserDataSource!
    
    override func setUp() {
        super.setUp()
        dataSource = UserDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }
    
    func testEmptyValueInDataSource() {
        
        // giving empty data value
        dataSource.data.value = []
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected zero cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }
    
    func testValueInDataSource() {
        
        // giving data value
        let dummyUserCellVM1 = UserCellViewModel(user: User(userDict: ["title":"My title1"])!)
        let dummyUserCellVM2 = UserCellViewModel(user: User(userDict: ["title":"My title2"])!)
        dataSource.data.value = [dummyUserCellVM1, dummyUserCellVM2]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        // expected one section
        XCTAssertEqual(dataSource.numberOfSections(in: tableView), 1, "Expected one section in table view")
        
        // expected two cells
        XCTAssertEqual(dataSource.tableView(tableView, numberOfRowsInSection: 0), 2, "Expected two cell in table view")
    }
    
    func testValueCell() {
        
        // giving data value
        let dummyUserCellVM1 = UserCellViewModel(user: User(userDict: ["title":"My title1"])!)
        dataSource.data.value = [dummyUserCellVM1]
        
        let tableView = UITableView()
        tableView.dataSource = dataSource
        tableView.register(UserTVC.self, forCellReuseIdentifier: kUserCellID)
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        // expected UserTableViewCell class
        guard let _ = dataSource.tableView(tableView, cellForRowAt: indexPath) as? UserTVC else {
            XCTAssert(false, "Expected UserTableViewCell class")
            return
        }
    }
}
