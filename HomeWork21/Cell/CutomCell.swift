//
//  CutomCell.swift
//  HomeWork21
//
//  Created by Dato on 11.08.22.
//

import UIKit

class CutomCell: UITableViewCell {

    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var alphaCode: UILabel!
    
    @IBOutlet weak var flagImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
