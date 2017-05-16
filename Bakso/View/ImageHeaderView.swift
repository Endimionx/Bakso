//
//  ImageHeaderCell.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/3/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

class ImageHeaderView : UIView {
    
    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var backgroundImage : UIImageView!
    
    @IBOutlet weak var lblNamw: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(hex: "0080c1")
        self.profileImage.layoutIfNeeded()
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.borderWidth = 1
        self.profileImage.layer.borderColor = UIColor.white.cgColor
        //self.profileImage.setRandomDownloadImage(80, height: 80)
        //self.backgroundImage.setRandomDownloadImage(Int(self.bounds.size.width), height: 160)
        
        
        //let start = CGPoint(x: 10, y: self.frame.height - 15)
        //let end = CGPoint(x: self.frame.width - 30, y: self.frame.height - 15)
        
        //drawLineFromPoint(start: start, toPoint: end, ofColor: UIColor.white, inView: self)
        
    }
    
}
