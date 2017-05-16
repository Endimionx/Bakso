//
//  SlideCell.swift
//  Bakso
//
//  Created by Macbook on 5/14/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
class SlideCell: UITableViewCell {
    
    var myLabel = UILabel()
    var lblTitle = UILabel()
    var lblJadwal = UILabel()
    var lblAkomodasi = UIVerticalAlignLabel()
    var lblKuota = UILabel()
    
    var imgTitle = UIImageView()
    var imgJadwal = UIImageView()
    var imgAkomodasi = UIImageView()
    var imgKuota = UIImageView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.frame = CGRect(x:0, y:0, width: contentView.frame.width, height: 40)
        contentView.backgroundColor = UIColor(hex: "0080c1")
        
        imgTitle.image = UIImage(named:"ic_slide_shop")
        self.contentView.addSubview(imgTitle)
        
        lblTitle.font = UIFont.boldSystemFont(ofSize: 13.0)
        lblTitle.textColor = UIColor.white
        self.contentView.addSubview(lblTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgTitle.frame = CGRect(x: 15, y: 10, width: 20, height: 20)
        
        lblTitle.frame = CGRect(x: 60, y: 5, width: 200, height: 30)
        
        
    }
}
