//
//  ItemNotifTableCell.swift
//  Bakso
//
//  Created by Macbook on 5/19/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class ItemNotifTableCell: UITableViewCell {
    var imgMenu: UIImageView!
    var lblNamaBakso: UILabel!
    var lblJumlah_: UIVerticalAlignLabel!
    
    
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
        
        var frame = self.bounds
        frame.size.width = frame.width
        frame.size.height = frame.height
        
        imgMenu = UIImageView()
        imgMenu.frame = CGRect(x: 5, y: 5, width: 80, height: 60)
        imgMenu.image = UIImage(named: "im_berita")
        contentView.addSubview(imgMenu)
        
        
        lblNamaBakso = UILabel()
        lblNamaBakso.font = UIFont.systemFont(ofSize: 14.0)
        lblNamaBakso.textColor = UIColor.darkGray
        lblNamaBakso.frame = CGRect(x: 90, y: 5, width: contentView.frame.width - 45, height: 20)
        contentView.addSubview(lblNamaBakso)
        
        lblJumlah_ = UIVerticalAlignLabel()
        lblJumlah_.font = UIFont.systemFont(ofSize: 12.0)
        lblJumlah_.textColor = UIColor.darkGray
        lblJumlah_.text = "Jumlah "
        lblJumlah_.numberOfLines = 0
        lblJumlah_.frame = CGRect(x: 105, y: 25, width: contentView.frame.width - 115, height: 45)
        contentView.addSubview(lblJumlah_)
   
        
        //contentView.backgroundColor = UIColor.darkGray
        
        contentView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
    }
    
    
}
