//
//  PrincipalTableViewCell.swift
//  Pimpam
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit

class PrincipalTableViewCell: UITableViewCell {
    @IBOutlet weak var titlelabel : UILabel?
     @IBOutlet weak var descriptionlabel : UILabel?
     @IBOutlet weak var numberlabel : UILabel?
    @IBOutlet weak var foodimg : UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
