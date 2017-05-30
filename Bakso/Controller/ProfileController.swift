//
//  ProfileController.swift
//  Bakso
//
//  Created by Macbook on 5/20/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    var scrollView = UIScrollView()
    var viewTop = UIView()
    var imgApps = UIImageView()
    var viewMain = UIView()
    var lblNama_ = UILabel()
    var lblNama = UILabel()
    var lblTgl_ = UILabel()
    var lblTgl = UILabel()
    var lblTelp_ = UILabel()
    var lblTelp = UILabel()
    var lblAlamat_ = UILabel()
    var lblAlamat = UILabel()
    var lblProvinsi_ = UILabel()
    var lblProvinsi = UILabel()
    var lblKota_ = UILabel()
    var lblKota = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.backgroundColor = UIColor.groupTableViewBackground
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Profil", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        let button_ = UIButton(type: .system)
        button_.setImage(UIImage(named: "ic_edit"), for: .normal)
        button_.setTitle("", for: .normal)
        button_.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button_.addTarget(self, action: #selector(goEdit), for: .touchUpInside)
        button_.sizeToFit()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button_)
        
        viewTop.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.height * 0.3))
        viewTop.backgroundColor = mainColor
      
        
        imgApps.image = UIImage(named: "wall")
        imgApps.frame = CGRect(x: 0, y: (viewTop.frame.height / 4), width: (viewTop.frame.height / 2), height: (viewTop.frame.height / 2))
        imgApps.center.x = viewTop.center.x
        imgApps.layer.cornerRadius = imgApps.bounds.size.height / 2
        imgApps.clipsToBounds = true
        imgApps.layer.borderWidth = 1
        imgApps.layer.borderColor = UIColor.white.cgColor
        
        viewTop.addSubview(imgApps)
        
        let lbl = UILabel()
        lbl.frame = CGRect(x: 0, y: viewTop.frame.origin.y + viewTop.frame.height, width: view.frame.width, height: 40)
        //lbl.backgroundColor = UIColor.groupTableViewBackground
        lbl.textColor = UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.text = "INFORMASI PENGGUNA"
        
        
        viewMain.frame = CGRect(x: 0, y: lbl.frame.origin.y + lbl.frame.height, width: view.frame.width, height: (view.frame.height * 0.4))
        viewMain.backgroundColor = UIColor.white
        
        lblNama_.frame = CGRect(x: 10, y: 10, width: view.frame.width, height: 20)
        lblNama_.textColor = UIColor.darkGray
        lblNama_.textAlignment = .left
        lblNama_.font = UIFont.boldSystemFont(ofSize: 12)
        lblNama_.text = "Nama"
        
        lblNama.frame = CGRect(x: 10, y: 30, width: view.frame.width, height: 20)
        lblNama.textColor = UIColor.black
        lblNama.textAlignment = .left
        lblNama.font = UIFont.boldSystemFont(ofSize: 12)
        lblNama.text = "Ladur Cobain"
        
        
        lblTgl_.frame = CGRect(x: 10, y: 60, width: view.frame.width, height: 20)
        lblTgl_.textColor = UIColor.darkGray
        lblTgl_.textAlignment = .left
        lblTgl_.font = UIFont.boldSystemFont(ofSize: 12)
        lblTgl_.text = "Tanggal Lahir"
        
        lblTgl.frame = CGRect(x: 10, y: 80, width: view.frame.width, height: 20)
        lblTgl.textColor = UIColor.black
        lblTgl.textAlignment = .left
        lblTgl.font = UIFont.boldSystemFont(ofSize: 12)
        lblTgl.text = "19-02-2016"
        
        lblTelp_.frame = CGRect(x: 10, y: 110, width: view.frame.width, height: 20)
        lblTelp_.textColor = UIColor.darkGray
        lblTelp_.textAlignment = .left
        lblTelp_.font = UIFont.boldSystemFont(ofSize: 12)
        lblTelp_.text = "No. Telepon"
        
        lblTelp.frame = CGRect(x: 10, y: 130, width: view.frame.width, height: 20)
        lblTelp.textColor = UIColor.black
        lblTelp.textAlignment = .left
        lblTelp.font = UIFont.boldSystemFont(ofSize: 12)
        lblTelp.text = "081808888523"
        
        lblAlamat_.frame = CGRect(x: 10, y: 160, width: view.frame.width, height: 20)
        lblAlamat_.textColor = UIColor.darkGray
        lblAlamat_.textAlignment = .left
        lblAlamat_.font = UIFont.boldSystemFont(ofSize: 12)
        lblAlamat_.text = "Alamat"
        
        lblAlamat.frame = CGRect(x: 10, y: 180, width: view.frame.width, height: 20)
        lblAlamat.textColor = UIColor.black
        lblAlamat.textAlignment = .left
        lblAlamat.font = UIFont.boldSystemFont(ofSize: 12)
        lblAlamat.text = "Jln Mandalika 5 RT 08/09 Jakarta Barat"
        
        lblProvinsi_.frame = CGRect(x: 10, y: 210, width: view.frame.width, height: 20)
        lblProvinsi_.textColor = UIColor.darkGray
        lblProvinsi_.textAlignment = .left
        lblProvinsi_.font = UIFont.boldSystemFont(ofSize: 12)
        lblProvinsi_.text = "Provinsi"
        
        lblProvinsi.frame = CGRect(x: 10, y: 230, width: view.frame.width, height: 20)
        lblProvinsi.textColor = UIColor.black
        lblProvinsi.textAlignment = .left
        lblProvinsi.font = UIFont.boldSystemFont(ofSize: 12)
        lblProvinsi.text = "DKI Jakarta"
        
        lblKota_.frame = CGRect(x: 10, y: 260, width: view.frame.width, height: 20)
        lblKota_.textColor = UIColor.darkGray
        lblKota_.textAlignment = .left
        lblKota_.font = UIFont.boldSystemFont(ofSize: 12)
        lblKota_.text = "Kota"
        
        lblKota.frame = CGRect(x: 10, y: 280, width: view.frame.width, height: 20)
        lblKota.textColor = UIColor.black
        lblKota.textAlignment = .left
        lblKota.font = UIFont.boldSystemFont(ofSize: 12)
        lblKota.text = "Jakarta Barat"
        
        
        viewMain.addSubview(lblNama_)
        viewMain.addSubview(lblNama)
        viewMain.addSubview(lblTgl_)
        viewMain.addSubview(lblTgl)
        viewMain.addSubview(lblTelp_)
        viewMain.addSubview(lblTelp)
        viewMain.addSubview(lblAlamat_)
        viewMain.addSubview(lblAlamat)
        viewMain.addSubview(lblProvinsi_)
        viewMain.addSubview(lblProvinsi)
        viewMain.addSubview(lblKota_)
        viewMain.addSubview(lblKota)
        
        scrollView.addSubview(viewTop)
        scrollView.addSubview(lbl)
        scrollView.addSubview(viewMain)
        
        
        view.addSubview(scrollView)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async(execute: { () -> Void in
            self.resizeToFitSubviewsView()
            self.resizeToFitSubviewsScrollView()
            return
        })
        
    }
    
    func resizeToFitSubviewsView() {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in viewMain.subviews {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
            
        }
        self.viewMain.frame.size = CGSize(width:viewMain.frame.width, height: height + 20 )
    }
    
    func resizeToFitSubviewsScrollView() {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in scrollView.subviews {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
            
        }
        self.scrollView.contentSize = CGSize(width:0, height: height + 5 )
    }
    
    func goBack(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    func goEdit(){
        
        let vc = EditProfileController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
