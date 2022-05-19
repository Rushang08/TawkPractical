//
//  InvertedColorTableViewCell.swift
//  TawkPractical
//
//  Created by Rushang Prajapati on 18/05/22.
//

import UIKit

class InvertedColorTableViewCell: UITableViewCell {
    @IBOutlet weak var imgAvtar: ImageLoading!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupData(objUser: UserList) {
        
        imgAvtar.downloadImageFrom(url: URL(string: objUser.avatarUrl!)!, isConverted: false, imageMode: .scaleAspectFit)
        lblName.text = objUser.login! + "Id: " + "\(String(describing: objUser.id!))"
        lblDetails.text = "NOTES AVAILABLE"
        
        
    }
    
}
