//
//  TableViewCell.swift
//  Core Data
//
//  Created by Sharetrip-iOS on 16/08/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLbl : UILabel!
    @IBOutlet weak var addressLbl : UILabel!
    
    static let identifier = "cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

 
}
