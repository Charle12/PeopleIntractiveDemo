//
//  UserViewModel.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import Foundation

struct UserViewModel {
    
    weak var dataSource : GenericDataSource<UserCellViewModel>?
    weak var service: ServiceHelperProtocol?
    
    init(service: ServiceHelperProtocol = ServiceHelper.shared, dataSource : GenericDataSource<UserCellViewModel>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchUsers(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
            return
        }
        
        service.fetchUsers() { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let metaData) :
                    // reload data
                    self.dataSource?.data.value = self.getUserCellViewModelsWith(users: metaData.users ?? [])
                    completion?(Result.success(true))
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    completion?(Result.failure(error))
                    
                    break
                }
            }
        }
    }
    
    func  getUserCellViewModelsWith(users:[User]) -> [UserCellViewModel] {
        var userCellVMList:[UserCellViewModel] = []
        for user in users {
            let userCellViewModel = UserCellViewModel(user: user)
            userCellVMList.append(userCellViewModel)
        }
        return userCellVMList
    }
}
