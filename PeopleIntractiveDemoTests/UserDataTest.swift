//
//  UserDataTest.swift
//  PeopleIntractiveDemoTests
//
//  Created by Admin on 2/5/21.
//

import XCTest

@testable import PeopleIntractiveDemo

let kSampleName = "Leanne Graham"
let kSampleCompanyName = "Romaguera-Crona"
let kSamplePhone = "1-770-736-8031 x56442"
let kSampleWebsite = "hildegard.org"

let kSampleUserCount = 1

class UserDataTest: XCTestCase {
    
    func testParseEmptyUsersData() {
        
        // giving empty data
        let data = Data()
        
        // giving completion after parsing
        // expected valid NewsData with   valid User data
        let completion : ((Result<UsersData, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParseUsersData() {
        
        // giving a sample json file
        guard let data = FileManager.readJson(forResource: "sample") else {
            XCTAssert(false, "Can't get data from sample.json")
            return
        }
        
        // giving completion after parsing
        // expected valid converter with valid data
        let completion : ((Result<UsersData, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid newsData")
            case .success(let userData):
                
                XCTAssertEqual(userData.users?.count, kSampleUserCount, "Expected \(kSampleUserCount)")
                XCTAssertEqual(userData.users?.first?.name, kSampleName, "Expected \(kSampleName)")
                XCTAssertEqual(userData.users?.first?.company?.name, kSampleCompanyName, "Expected \(kSampleCompanyName)")
                XCTAssertEqual(userData.users?.first?.phone, kSamplePhone, "Expected \(kSamplePhone)")
                XCTAssertEqual(userData.users?.first?.website, kSampleWebsite, "Expected \(kSampleWebsite)")
            }
        }
        
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testWrongKeyUsersData() {
        
        // giving a wrong dictionary
        let dictionary = ["test" as AnyObject]
        
        // expected to return error of NewsData
        let result = UsersData.parseObject(dictionary: dictionary)
        
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }
}

extension FileManager {
    
    static func readJson(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: UserDataTest.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
                // handle error
            }
        }
        return nil
    }
}

