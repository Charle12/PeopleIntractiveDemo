//
//  UserTVC.swift
//  PeopleIntractiveDemo
//
//  Created by Admin on 12/12/20.
//

import UIKit

class UserTVC: UITableViewCell {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var phoneAndWebsiteLabel:UILabel!
    @IBOutlet weak var companyLabel:UILabel!
    @IBOutlet weak var userIcon:UIImageView!
    @IBOutlet weak var starBtn:UIButton!

    var userCellVM : UserCellViewModel? {
        didSet {
            guard let userCellVM = userCellVM else {
                return
            }
            nameLabel?.text = userCellVM.name
            phoneAndWebsiteLabel?.text = userCellVM.phoneAndWebsite
            companyLabel?.text = userCellVM.company
            starBtn.isSelected = userCellVM.isSelectedStar ?? false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCellUI() {
        self.nameLabel?.textColor = kPrimaryTextColor
        self.phoneAndWebsiteLabel?.textColor = kSecondryTextColor
        self.companyLabel?.textColor = kSecondryTextColor
    }
    
    @IBAction func starBtnTapped(_ sender: UIButton) {
        starBtn.isSelected = !starBtn.isSelected
        userCellVM?.isSelectedStar = starBtn.isSelected
    }
}
