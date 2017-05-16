//
//  MyCustomCell.swift
//  Bakso
//
//  Created by Macbook on 5/14/17.
//  Copyright © 2017 KGN. All rights reserved.
//


import UIKit
class MyCustomCell: UITableViewCell {
    
    var myLabel = UILabel()
    var lblBulan = UILabel()
    var lblJadwal = UILabel()
    var lblAkomodasi = UIVerticalAlignLabel()
    var lblKuota = UILabel()
    
    var imgBulan = UIImageView()
    var imgJadwal = UIImageView()
    var imgAkomodasi = UIImageView()
    var imgKuota = UIImageView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.frame = CGRect(x:0, y:0, width: contentView.frame.width, height: 120)
        
        
        imgBulan.image = UIImage(named:"ic_event")
        imgJadwal.image = UIImage(named:"ic_date_range")
        imgAkomodasi.image = UIImage(named:"ic_flight_takeoff")
        imgKuota.image = UIImage(named:"ic_jmlh")
        
        self.contentView.addSubview(imgBulan)
        self.contentView.addSubview(imgJadwal)
        self.contentView.addSubview(imgAkomodasi)
        self.contentView.addSubview(imgKuota)
        
        lblBulan.font = UIFont.systemFont(ofSize: 13.0)
        lblJadwal.font = UIFont.systemFont(ofSize: 13.0)
        lblAkomodasi.font = UIFont.systemFont(ofSize: 13.0)
        lblKuota.font = UIFont.systemFont(ofSize: 14.0)
        
        lblAkomodasi.numberOfLines = 0
        //lblAkomodasi.lineBreakMode = .byWordWrapping
        //lblAkomodasi.sizeToFit()
        
        self.contentView.addSubview(lblBulan)
        self.contentView.addSubview(lblJadwal)
        self.contentView.addSubview(lblAkomodasi)
        self.contentView.addSubview(lblKuota)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgBulan.frame = CGRect(x: 15, y: 7, width: 16, height: 16)
        imgJadwal.frame = CGRect(x: 15, y: 28, width: 16, height: 16)
        imgAkomodasi.frame = CGRect(x: 15, y: 49, width: 16, height: 16)
        imgKuota.frame = CGRect(x: contentView.frame.width - 50 - 20, y: 7, width: 16, height: 16)
        
        lblBulan.frame = CGRect(x: 40, y: 5, width: 70, height: 15)
        lblJadwal.frame = CGRect(x: 40, y: 28, width: 170, height: 15)
        lblAkomodasi.frame = CGRect(x: 40, y: 49, width: contentView.frame.width - 45, height: 80)
        lblKuota.frame = CGRect(x: contentView.frame.width - 50, y: 5, width: 50, height: 21)
        
        
    }
}
