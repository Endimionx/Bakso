//
//  ItemBayarTableCell.swift
//  Bakso
//
//  Created by Macbook on 5/17/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class ItemBayarTableCell: UITableViewCell {
    var lblNomer: UIVerticalAlignLabel!
    var lblNamaBakso: UIVerticalAlignLabel!
    var lblJumlah_: UIVerticalAlignLabel!
    var lblJumlah: UIVerticalAlignLabel!
    var lblHarga: UILabel!
    
    
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
        
      
        lblNomer = UIVerticalAlignLabel()
        lblNomer.font = UIFont.systemFont(ofSize: 12.0)
        lblNomer.textColor = UIColor.white
        lblNomer.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        
        contentView.addSubview(lblNomer)
        
        
        lblNamaBakso = UIVerticalAlignLabel()
        lblNamaBakso.font = UIFont.systemFont(ofSize: 12.0)
        lblNamaBakso.textColor = UIColor.white
        lblNamaBakso.numberOfLines = 0
        lblNamaBakso.sizeToFit()
        lblNamaBakso.frame = CGRect(x: 30, y: 10, width: 120, height: 30)
        contentView.addSubview(lblNamaBakso)
        
        lblJumlah = UIVerticalAlignLabel()
        lblJumlah.font = UIFont.systemFont(ofSize: 12.0)
        lblJumlah.textColor = UIColor.white
        lblJumlah.text = "Jumlah "
        lblJumlah.textAlignment = .center
        lblJumlah.frame = CGRect(x: 150, y: 10, width: 30, height: 20)
        contentView.addSubview(lblJumlah)
        
        lblJumlah_ = UIVerticalAlignLabel()
        lblJumlah_.font = UIFont.systemFont(ofSize: 12.0)
        lblJumlah_.textColor = UIColor.white
        lblJumlah_.text = " x "
        lblJumlah_.frame = CGRect(x: 180, y: 10, width: 10, height: 20)
        contentView.addSubview(lblJumlah_)
        
        
        lblHarga = UILabel()
        lblHarga.textColor = UIColor.white
        lblHarga.font = UIFont.boldSystemFont(ofSize: 12)
        lblHarga.text = "Rp. 20,000 "
        lblHarga.textAlignment = .right
        lblHarga.frame = CGRect(x: 180, y: 7, width: 110, height: 20)
        contentView.addSubview(lblHarga)
       
        
        contentView.backgroundColor = UIColor(hex: "fbbc05")
        
        contentView.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        
    }
    
    
}
