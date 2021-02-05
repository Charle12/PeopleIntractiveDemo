//
//  UserCellViewModel.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import Foundation

class UserCellViewModel {
    
    var name:String?
    var userName:String?
    var address:String?
    var phoneAndWebsite:String?
    var company:String?
    var isSelectedStar:Bool?
    
    init(user:User) {
        self.name = user.name
        self.userName = user.userName
        self.address = "\(user.address?.suite ?? ""), \(user.address?.street ?? ""), \(user.address?.city ?? ""), \(user.address?.zipcode ?? "")"
        self.phoneAndWebsite = "\(user.phone ?? "") | \(user.website ?? "")"
        self.company = user.company?.name
    }
}
