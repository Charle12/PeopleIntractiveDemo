//
//  UsersVC.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import UIKit

let kEstimatedNewsRableRowHeight:CGFloat = 100.0

class UsersVC: UIViewController {
    
    @IBOutlet weak var userTableView:UITableView!
    
    var dataSource = UserDataSource()
    
    lazy var viewModel : UserViewModel = {
        let viewModel = UserViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = kNewsTitleString
        setUpIntials()
    }
    
    //MARK:- UI setu methods
    func setUpIntials() {
        //Setup UI
        self.userTableView.rowHeight = UITableView.automaticDimension
        self.userTableView.estimatedRowHeight = kEstimatedNewsRableRowHeight
        //Setup datasource
        self.userTableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.userTableView.reloadData()
        }
        // Fetch user if network available
        Utils.isConnectedToNetwork() ? fetchUser() : showAlertWithMessgae(message: kNoNetworkErrorMessgae)
    }
    
    func fetchUser() {
        Spinner.useContainerView(view)
        Spinner.show("Please wait loading users data ....")
        self.viewModel.fetchUsers({[weak self] result in
            Spinner.hide()
            switch result {
            case .failure(let error):
                self?.showAlertWithMessgae(message: error.localizedDescription)
            default:
                NSLog("sucess")
            }
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userTableView.reloadData()
    }
}

//MARK:- Extension for TableViewDelegate handling
extension UsersVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: kNewDetailSegue, sender: self.dataSource.data.value[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
}

extension UsersVC {
    
    //MARK:- Alert
    func showAlertWithMessgae(message:String) {
        
        let alertView = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
        let action = UIAlertAction(title: kOkButtonTitle, style: .default, handler: nil)
        alertView.addAction(action)
        self.present(alertView, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == kNewDetailSegue {
            let userDetailVC = segue.destination as? UsersDetailVC
            userDetailVC?.userCellViewModel = (sender as! UserCellViewModel)
        }
    }
}



