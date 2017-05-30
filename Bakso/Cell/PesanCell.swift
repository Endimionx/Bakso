//
//  PesanCell.swift
//  Bakso
//
//  Created by Macbook on 5/24/17.
//  Copyright © 2017 KGN. All rights reserved.
//


import UIKit

class PesanCell: UICollectionViewCell {
    var imgIcon = UIImageView()
    var imgMenu =  UIImageView()
    var lblTitle =  UILabel()
    var lblHarga = UILabel()
    var viewBottom = UIView()
    var lblTgl =  UILabel()
    var lblConfirm =  UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        var frame = self.bounds
        frame.size.width = frame.width // min(frame.width, frame.height)
        frame.size.height = frame.height
        
        
        imgMenu = UIImageView()
        imgMenu.frame = CGRect(x: 0, y: 0, width:frame.width , height: frame.height)
        //imgMenu.image = UIImage(named: "im_berita")
        imgMenu.backgroundColor = UIColor(hex: "34a853")
        contentView.addSubview(imgMenu)
        
        lblTgl = UILabel()
        lblTgl.frame = CGRect(x: 0, y: 3, width: frame.width - 5, height: 20)
        lblTgl.textColor = UIColor.white
        lblTgl.textAlignment = .right
        lblTgl.font = UIFont.systemFont(ofSize: 11)
        contentView.addSubview(lblTgl)
        
        viewBottom = UIView()
        viewBottom.frame = CGRect(x: 0, y: ((frame.height / 3) * 2) , width: frame.width, height: (frame.height / 3) )
        viewBottom.backgroundColor = UIColor.black.withAlphaComponent(0.30)
        
        let h = (viewBottom.frame.height / 3)
        
        lblTitle = UILabel()
        lblTitle.font = UIFont.systemFont(ofSize: 13.0)
        lblTitle.textColor = UIColor.white
        lblTitle.textAlignment = .left
        lblTitle.numberOfLines = 1
        lblTitle.frame = CGRect(x: 5, y: (h / 2) - 2 , width: contentView.frame.width - 10, height: h)
        viewBottom.addSubview(lblTitle)
        
        lblHarga = UILabel()
        lblHarga.font = UIFont.boldSystemFont(ofSize: 13.0)
        lblHarga.textColor = UIColor.white //(hex: "fef3fa")
        lblHarga.numberOfLines = 1
        lblHarga.frame = CGRect(x: 5, y: ((h / 2) + h) , width: contentView.frame.width - 45, height: h)
        viewBottom.addSubview(lblHarga)
        
        imgIcon = UIImageView()
        imgIcon.frame = CGRect(x: viewBottom.frame.width - ( h + 15), y:  (viewBottom.frame.height - 20) / 2, width: h + 10 , height: h + 10)
        imgIcon.image = UIImage(named: "ic_apps")
        viewBottom.addSubview(imgIcon)
        
        lblConfirm = UILabel()
        lblConfirm.frame = CGRect(x: 0, y: ((frame.height - viewBottom.frame.height ) / 2) , width: frame.width, height: 25)
        lblConfirm.textColor = UIColor.white
        lblConfirm.textAlignment = .center
        lblConfirm.font = UIFont.systemFont(ofSize: 18)
        contentView.addSubview(lblConfirm)
        
        contentView.addSubview(viewBottom)
        
        //contentView.backgroundColor = UIColor(hex: "ea4335")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) { //Your code should go here.
        super.draw(rect)
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        
    }
    
}
