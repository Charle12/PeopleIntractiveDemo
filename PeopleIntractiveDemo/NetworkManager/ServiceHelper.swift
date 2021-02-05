//
//  ServiceHelper.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/13/20.
//

import Foundation

// API URLS
let API_BASE_URL = "https://jsonplaceholder.typicode.com/"
let USERS_API_URL = API_BASE_URL + "\("users")"


protocol ServiceHelperProtocol : class {
    func fetchUsers(_ completion: @escaping ((Result<UsersData, ErrorResult>) -> Void))
}

final class ServiceHelper: GenericAPIClient, ServiceHelperProtocol {
    
    static let shared = ServiceHelper()
    
    let apiUrlStr = USERS_API_URL
    var task : URLSessionTask?
    
    func fetchUsers(_ completion: @escaping ((Result<UsersData, ErrorResult>) -> Void)) {
        
        // cancel previous request if already in progress
        self.cancelFetchUsers()
        task = APIClient().loadData(urlString: apiUrlStr, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchUsers() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
