//
//  NewsDataSource.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: GenericValue<[T]> = GenericValue([])
}

class UserDataSource : GenericDataSource<UserCellViewModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell configuration
        let cell = tableView.dequeueReusableCell(withIdentifier: kUserCellID, for: indexPath) as! UserTVC
        cell.selectionStyle = .none
        cell.configCellUI()

        // Set cell data
        let userCellVM = self.data.value[indexPath.row]
        cell.userCellVM = userCellVM
        return cell
    }
}

