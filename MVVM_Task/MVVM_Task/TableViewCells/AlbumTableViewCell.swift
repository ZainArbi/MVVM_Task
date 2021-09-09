//
//  AlbumTableViewCell.swift
//  MVVM_Task
//
//  Created by ZainAli on 08/09/2021.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var albumImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
