//
//  UserModel.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import Foundation

struct UsersData {
    var users: [User]?
}

extension UsersData: Parsable {
    static func parseObject(dictionary: [AnyObject]) -> Result<UsersData, ErrorResult> {
        if let results = dictionary as? [[String: Any]] {
            let users = results.map({ User(userDict: $0)}).compactMap{$0}
            let meta = UsersData(users: users)
            return Result.success(meta)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse API response"))
        }
    }
}

struct User {
    var id:Int?
    var name:String?
    var userName:String?
    var email:String?
    var phone:String?
    var website:String?
    var address:Address?
    var company:Company?

    init?(userDict:Dictionary <String, Any>) {
        self.id = userDict[UserConstant.KEY_ID] as? Int
        self.name = userDict[UserConstant.KEY_NAME] as? String
        self.userName = userDict[UserConstant.KEY_USER_NAME] as? String
        self.email = userDict[UserConstant.KEY_EMAIL] as? String
        self.phone = userDict[UserConstant.KEY_PHONE] as? String
        self.website = userDict[UserConstant.KEY_WEBSITE] as? String
        
        if let address = userDict[UserConstant.KEY_ADDRESS] as? Dictionary<String, Any> {
            self.address = Address.init(addressDict: address)
        }
        
        if let company = userDict[UserConstant.KEY_COMPANY] as? Dictionary<String, Any> {
            self.company = Company.init(companyDict: company)
        }
    }
}

struct Address {
    var street:String?
    var suite:String?
    var city:String?
    var zipcode:String?

    init?(addressDict:Dictionary <String, Any>) {
        self.street = addressDict[UserConstant.KEY_STREET] as? String
        self.suite = addressDict[UserConstant.KEY_SUITE] as? String
        self.city = addressDict[UserConstant.KEY_CITY] as? String
        self.zipcode = addressDict[UserConstant.KEY_ZIPCODE] as? String
    }
}

struct Company {
    var name:String?
    var catchPhrase:String?
    var bs:String?

    init?(companyDict:Dictionary <String, Any>) {
        self.name = companyDict[UserConstant.KEY_COMPANY_NAME] as? String
        self.catchPhrase = companyDict[UserConstant.KEY_CATCH_PHRASE] as? String
        self.bs = companyDict[UserConstant.KEY_BS] as? String
    }
}

