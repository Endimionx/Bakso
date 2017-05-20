//
//  KritikController.swift
//  Bakso
//
//  Created by Macbook on 5/19/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class KritikController: UIViewController {

    var viewTop = UIView()
    var imgApps = UIImageView()
    var txtDesc : UITextView?
    var btnKirim = CustomButton2(type : UIButtonType.system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.groupTableViewBackground
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Kritik dan Saran", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        viewTop.frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height / 3)
        viewTop.backgroundColor = UIColor(hex: "214a79")
        
        let lblTitle = UILabel()
        lblTitle.frame = CGRect(x: 0, y: 0, width: viewTop.frame.width, height: viewTop.frame.height / 3)
        lblTitle.font = UIFont.boldSystemFont(ofSize: 20)
        lblTitle.textAlignment = .center
        lblTitle.text = "Kritik dan Saran"
        lblTitle.textColor = UIColor.white
        lblTitle.center.x = viewTop.center.x
        
        viewTop.addSubview(lblTitle)
        
        imgApps.image = UIImage(named: "ic_apps")
        imgApps.frame = CGRect(x: 0, y: 60, width: viewTop.frame.height / 3, height: viewTop.frame.height / 3)
        imgApps.center.x = viewTop.center.x
        
        viewTop.addSubview(imgApps)
        
        
        let lblIsi_ = UILabel()
        lblIsi_.frame = CGRect(x: 0, y: (viewTop.frame.height / 3) * 2, width: viewTop.frame.width, height: viewTop.frame.height / 3)
        lblIsi_.font = UIFont.systemFont(ofSize: 11)
        lblIsi_.textAlignment = .center
        lblIsi_.numberOfLines = 0
        lblIsi_.text = "Isi kolom untuk memberikan \r\nKritik dan Saran"
        lblIsi_.textColor = UIColor.white
        lblIsi_.center.x = viewTop.center.x
        
        viewTop.addSubview(lblIsi_)
        
        txtDesc = UITextView()
        txtDesc?.frame = CGRect(x: 10, y: viewTop.frame.origin.y + viewTop.frame.height + 10, width: view.frame.width - 20, height: (view.frame.height / 3) * 0.5)
        txtDesc?.text = "Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi "
        txtDesc?.textColor = UIColor.darkGray
        txtDesc?.backgroundColor = UIColor.white
        txtDesc?.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        txtDesc?.layer.borderWidth = 1
        
        btnKirim.frame = CGRect(x: view.frame.width * 0.1 , y: (txtDesc?.frame.origin.y)! + (txtDesc?.frame.height)! + 10, width: view.frame.width * 0.8, height: 35 )
        btnKirim.setTitle("Kirim", for: .normal)
        btnKirim.setTitleColor(UIColor.white, for: .normal)
        btnKirim.buttonColor = UIColor(hex: "0080c1")
        btnKirim.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        
        view.addSubview(viewTop)
        view.addSubview(txtDesc!)
        view.addSubview(btnKirim)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func goBack(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

}
