//
//  RecipesCell.swift
//  Pimpam
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit

class RecipesCell: UITableViewCell {
    @IBOutlet weak var titlelabel : UILabel?
    @IBOutlet weak var difficultlabel : UILabel?
    @IBOutlet weak var foodrecipeimg : UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
