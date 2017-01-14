//
//  DrinkRewardTableViewCell.swift
//  nodrunkdriving
//
//  Created by Devin Nicholson on 1/14/17.
//  Copyright © 2017 Sarthak Khillon. All rights reserved.
//

import UIKit

class DrinkRewardTableViewCell: UITableViewCell {
    
    @IBAction func redeem(_ sender: AnyObject) {
        //curBar = self.barName.text!
    }
    
    @IBOutlet var star1: UIImageView!
    
    @IBOutlet var barName: UILabel!
    
    @IBOutlet var star2: UIImageView!
    
    @IBOutlet var star3: UIImageView!
    
    @IBOutlet var redeemButton: UIButton!
    
    @IBOutlet var star4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
