//
//  ItemTableCell.swift
//  Bakso
//
//  Created by Macbook on 5/17/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class ItemTableCell: UITableViewCell {
    var imgMenu: UIImageView!
    var lblNamaBakso: UILabel!
    var lblJumlah_: UILabel!
    var lblJumlah: UILabel!
    var lblHarga: UILabel!
    var btnPlus = CustomButton(type : UIButtonType.system)
    var btnCancel = CustomButton(type : UIButtonType.system)
    
    
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
        
        lblJumlah_ = UILabel()
        lblJumlah_.font = UIFont.systemFont(ofSize: 14.0)
        lblJumlah_.textColor = UIColor.darkGray
        lblJumlah_.text = "Jumlah "
        lblJumlah_.frame = CGRect(x: 90, y: 25, width: 50, height: 20)
        contentView.addSubview(lblJumlah_)
        
        lblJumlah = UILabel()
        lblJumlah.font = UIFont.systemFont(ofSize: 14.0)
        lblJumlah.textColor = UIColor.darkGray
        lblJumlah.text = "Jumlah "
        lblJumlah.textAlignment = .center
        lblJumlah.frame = CGRect(x: 140, y: 25, width: 15, height: 20)
        contentView.addSubview(lblJumlah)
        
        btnPlus = CustomButton(type : UIButtonType.system)
        btnPlus.frame = CGRect(x: 160 , y: 25, width: 20, height: 20)
        btnPlus.setTitle("+", for: .normal)
        btnPlus.setTitleColor(UIColor.white, for: .normal)
        btnPlus.buttonColor = mainColor
        btnPlus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btnPlus.layer.cornerRadius = btnPlus.bounds.size.height / 2
        btnPlus.clipsToBounds = true
        btnPlus.layer.borderWidth = 1
        btnPlus.layer.borderColor = UIColor.white.cgColor
        contentView.addSubview(btnPlus)
        
        
        lblHarga = UILabel()
        lblHarga.font = UIFont.systemFont(ofSize: 14.0)
        lblHarga.textColor = UIColor.darkGray
        lblHarga.font = UIFont.boldSystemFont(ofSize: 14)
        lblHarga.text = "Rp. 20,000 "
        lblHarga.textAlignment = .center
        lblHarga.frame = CGRect(x: 90, y: 45, width: 80, height: 20)
        contentView.addSubview(lblHarga)
        
        btnCancel.frame = CGRect(x: self.bounds.width - 90 , y: 45, width: 80, height: 20 )
        btnCancel.setTitle("Cancel Order", for: .normal)
        btnCancel.setTitleColor(UIColor.white, for: .normal)
        btnCancel.buttonColor = UIColor(hex: "0080c1")
        btnCancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        btnCancel.layer.cornerRadius = 5
        btnCancel.clipsToBounds = true
        
        contentView.addSubview(btnCancel)
        
        //contentView.backgroundColor = UIColor.darkGray
        
        contentView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
    }
    
    
}
