//
//  CustomCellProfile.swift
//  Bakso
//
//  Created by Macbook on 5/17/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class CustomCellProfile: UITableViewCell {
    var imgIcon: UIImageView!
    var imgMenu: UIImageView!
    var lblHeader: UILabel!
    var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)!
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgMenu = UIImageView()
        imgMenu.frame = CGRect(x: 5, y: 5, width: 80, height: 60)
        imgMenu.image = UIImage(named: "im_berita")
        contentView.addSubview(imgMenu)
        
        imgIcon = UIImageView()
        imgIcon.frame = CGRect(x: 100, y: 5, width: 20, height: 20)
        imgIcon.image = UIImage(named: "ic_date")
        contentView.addSubview(imgIcon)
        
        lblHeader = UILabel()
        lblHeader.font = UIFont.systemFont(ofSize: 12.0)
        lblHeader.textColor = UIColor.darkGray
        lblHeader.frame = CGRect(x: 127, y: 5, width: contentView.frame.width - 45, height: 20)
        contentView.addSubview(lblHeader)
        
        lblDetail = UILabel()
        lblDetail.font = UIFont.systemFont(ofSize: 14.0)
        lblDetail.textColor = UIColor.darkGray
        lblDetail.numberOfLines = 0
        lblDetail.frame = CGRect(x: 100, y: 25, width: contentView.frame.width - 45, height: 45)
        contentView.addSubview(lblDetail)
        
        
        contentView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
    }
    
}
