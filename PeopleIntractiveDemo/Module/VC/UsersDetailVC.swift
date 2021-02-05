//
//  UsersDetailVC.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import UIKit

class UsersDetailVC: UIViewController {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var userNameLabel:UILabel!
    @IBOutlet weak var addressLabel:UILabel!
    @IBOutlet weak var companyLabel:UILabel!
    @IBOutlet weak var phoneAndWebsiteLabel:UILabel!
    @IBOutlet weak var starBtn:UIButton!

    var userCellViewModel:UserCellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userCellViewModel?.name
        userNameLabel.text = userCellViewModel?.userName
        addressLabel.text = userCellViewModel?.address
        companyLabel.text = userCellViewModel?.company
        phoneAndWebsiteLabel.text = userCellViewModel?.phoneAndWebsite
        starBtn.isSelected = userCellViewModel?.isSelectedStar ?? false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func starBtnTapped(_ sender: UIButton) {
        starBtn.isSelected = !starBtn.isSelected
        userCellViewModel?.isSelectedStar = starBtn.isSelected
    }
}
