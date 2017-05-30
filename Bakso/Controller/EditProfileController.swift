//
//  EditProfileController.swift
//  Bakso
//
//  Created by Macbook on 5/22/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField


class EditProfileController: UIViewController, HADropDownDelegate {

    var scrollView = UIScrollView()
    var viewTop = UIView()
    var imgApps = UIImageView()
    var viewMain = UIView()
    var lblNama = JVFloatLabeledTextField()
    var lblTgl = JVFloatLabeledTextField()
    var lblTelp = JVFloatLabeledTextField()
    var lblAlamat = JVFloatLabeledTextField()
    var lblProvinsi_ = UILabel()
    var lblProvinsi = UILabel()
    var lblKota_ = UILabel()
    var lblKota = UILabel()
    
    var dropDown: HADropDown?
    var dropDownKota: HADropDown?
    
    var btnSimpan = CustomButton2(type : UIButtonType.system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.backgroundColor = UIColor.groupTableViewBackground
        
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Ubah Profil", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        viewTop.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.height * 0.3))
        viewTop.backgroundColor = UIColor.white
        
        
        imgApps.image = UIImage(named: "wall")
        imgApps.frame = CGRect(x: 0, y: (viewTop.frame.height / 4), width: (viewTop.frame.height / 2), height: (viewTop.frame.height / 2))
        imgApps.center.x = viewTop.center.x
        imgApps.layer.cornerRadius = imgApps.bounds.size.height / 2
        imgApps.clipsToBounds = true
        imgApps.layer.borderWidth = 1
        imgApps.layer.borderColor = UIColor.white.cgColor
        
        viewTop.addSubview(imgApps)
        
        
        
        
        viewMain.frame = CGRect(x: 0, y: viewTop.frame.origin.y + viewTop.frame.height + 10, width: view.frame.width, height: (view.frame.height * 0.4))
        viewMain.backgroundColor = UIColor.white
        
        let lbl = UILabel()
        lbl.frame = CGRect(x: 10, y: 5, width: view.frame.width, height: 30)
        //lbl.backgroundColor = UIColor.groupTableViewBackground
        lbl.textColor = UIColor.darkGray
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 14)
        lbl.text = "UBAH PENGGUNA"
        
        let width = CGFloat(0.3)
        let w = view.frame.width
        let space = 40
        let start_ = 50
        let height_ = 30
        let width_ = Int(viewMain.frame.width - 60)
        
        let start = CGPoint(x: 0, y: lbl.frame.origin.y + lbl.frame.height)
        let end = CGPoint(x: view.frame.width, y: lbl.frame.origin.y + lbl.frame.height)
        
        drawLineFromPoint(start: start, toPoint: end, ofColor: UIColor.groupTableViewBackground, inView: viewMain)
        
        
        lblNama.frame = CGRect(x: 30, y: start_, width: width_, height: height_)
        lblNama.keepBaseline = true
        lblNama.floatingLabelYPadding = -5
        lblNama.font = UIFont.systemFont(ofSize: 14)
        lblNama.floatingLabelFont = UIFont.systemFont(ofSize: 10)
        lblNama.placeholder = "Nama"
        lblNama.textAlignment = .left
        lblNama.isUserInteractionEnabled = true
        lblNama.textColor = UIColor.black
        lblNama.alwaysShowFloatingLabel = false
        lblNama.floatingLabelTextColor = UIColor.darkGray
        lblNama.floatingLabelActiveTextColor = UIColor.darkGray
        lblNama.placeholderColor = UIColor.darkGray
        lblNama.setPlaceholder("Nama", floatingTitle: "Nama")
        
        let border = CALayer()
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: lblNama.frame.size.height - width, width: lblNama.frame.size.width, height: 1)
        border.borderWidth = width
        lblNama.layer.addSublayer(border)
        
        
        lblTgl.frame = CGRect(x: 30, y: start_ + (space * 1), width: width_, height: height_)
        lblTgl.keepBaseline = true
        lblTgl.floatingLabelYPadding = -5
        lblTgl.font = UIFont.systemFont(ofSize: 14)
        lblTgl.floatingLabelFont = UIFont.systemFont(ofSize: 10)
        lblTgl.placeholder = "Tanggal Lahir"
        lblTgl.textAlignment = .left
        lblTgl.isUserInteractionEnabled = true
        lblTgl.textColor = UIColor.black
        lblTgl.alwaysShowFloatingLabel = false
        lblTgl.floatingLabelTextColor = UIColor.darkGray
        lblTgl.floatingLabelActiveTextColor = UIColor.darkGray
        lblTgl.placeholderColor = UIColor.darkGray
        lblTgl.setPlaceholder("Tanggal Lahir", floatingTitle: "Tanggal Lahir")
        
        let border1 = CALayer()
        border1.borderColor = UIColor.darkGray.cgColor
        border1.frame = CGRect(x: 0, y: lblTgl.frame.size.height - width, width: lblTgl.frame.size.width, height: 1)
        border1.borderWidth = width
        lblTgl.layer.addSublayer(border1)
        
        
        
        lblTelp.frame = CGRect(x: 30, y: start_ + (space * 2), width: width_, height: height_)
        lblTelp.keepBaseline = true
        lblTelp.floatingLabelYPadding = -5
        lblTelp.font = UIFont.systemFont(ofSize: 14)
        lblTelp.floatingLabelFont = UIFont.systemFont(ofSize: 10)
        lblTelp.placeholder = "No. Telepon"
        lblTelp.textAlignment = .left
        lblTelp.isUserInteractionEnabled = true
        lblTelp.textColor = UIColor.black
        lblTelp.alwaysShowFloatingLabel = false
        lblTelp.floatingLabelTextColor = UIColor.darkGray
        lblTelp.floatingLabelActiveTextColor = UIColor.darkGray
        lblTelp.placeholderColor = UIColor.darkGray
        lblTelp.setPlaceholder("No. Telepon", floatingTitle: "No. Telepon")
        
        let border2 = CALayer()
        border2.borderColor = UIColor.darkGray.cgColor
        border2.frame = CGRect(x: 0, y: lblTelp.frame.size.height - width, width: lblTelp.frame.size.width, height: 1)
        border2.borderWidth = width
        lblTelp.layer.addSublayer(border2)
        
 
        lblAlamat.frame = CGRect(x: 30, y: start_ + (space * 3), width: width_, height: height_)
        lblAlamat.keepBaseline = true
        lblAlamat.floatingLabelYPadding = -5
        lblAlamat.font = UIFont.systemFont(ofSize: 14)
        lblAlamat.floatingLabelFont = UIFont.systemFont(ofSize: 10)
        lblAlamat.placeholder = "Alamat"
        lblAlamat.textAlignment = .left
        lblAlamat.isUserInteractionEnabled = true
        lblAlamat.textColor = UIColor.black
        lblAlamat.alwaysShowFloatingLabel = false
        lblAlamat.floatingLabelTextColor = UIColor.darkGray
        lblAlamat.floatingLabelActiveTextColor = UIColor.darkGray
        lblAlamat.placeholderColor = UIColor.darkGray
        lblAlamat.setPlaceholder("Alamat", floatingTitle: "Alamat")
        
        let border3 = CALayer()
        border3.borderColor = UIColor.darkGray.cgColor
        border3.frame = CGRect(x: 0, y: lblAlamat.frame.size.height - width, width: lblAlamat.frame.size.width, height: 1)
        border3.borderWidth = width
        lblAlamat.layer.addSublayer(border3)
        
        
        lblProvinsi_.frame = CGRect(x: 30, y: start_ + (space * 4) - 5, width: Int(view.frame.width), height: 10)
        lblProvinsi_.textColor = UIColor.darkGray
        lblProvinsi_.textAlignment = .left
        lblProvinsi_.font = UIFont.boldSystemFont(ofSize: 10)
        lblProvinsi_.text = "Provinsi"
        
        dropDown = HADropDown()
        dropDown?.frame =  CGRect(x: 30 , y: start_ + (space * 4) + 10, width: width_, height: 20 )
        dropDown?.title = "Pilih"
        dropDown?.items = ["Cash", "EDC", "ATM"]
        dropDown?.titleFontSize = 14
        dropDown?.itemFontSize = 14
        dropDown?.textAllignment = .left
        dropDown?.font = UIFont.systemFont(ofSize: 14)
        //dropDown?.itemBackground = UIColor.groupTableViewBackground
        //dropDown?.backgroundColor = UIColor.groupTableViewBackground
        dropDown?.delegate = self
        
        let border4 = CALayer()
        border4.borderColor = UIColor.darkGray.cgColor
        border4.frame = CGRect(x: 0, y: (dropDown?.frame.size.height)! - width, width: (dropDown?.frame.size.width)!, height: 1)
        border4.borderWidth = width
        dropDown?.layer.addSublayer(border4)
        
        
        
        lblKota_.frame = CGRect(x: 30, y: start_ + (space * 5) - 5, width: Int(view.frame.width), height: 10)
        lblKota_.textColor = UIColor.darkGray
        lblKota_.textAlignment = .left
        lblKota_.font = UIFont.boldSystemFont(ofSize: 10)
        lblKota_.text = "Kota"
        
        dropDownKota = HADropDown()
        dropDownKota?.frame =  CGRect(x: 30 , y: start_ + (space * 5) + 10, width: width_, height: 20 )
        dropDownKota?.title = "Pilih"
        dropDownKota?.items = ["Cash", "EDC", "ATM"]
        dropDownKota?.titleFontSize = 14
        dropDownKota?.itemFontSize = 14
        dropDownKota?.textAllignment = .left
        dropDownKota?.font = UIFont.systemFont(ofSize: 14)
        //dropDown?.itemBackground = UIColor.groupTableViewBackground
        //dropDown?.backgroundColor = UIColor.groupTableViewBackground
        dropDownKota?.delegate = self

        
        
        
        viewMain.addSubview(lbl)
        viewMain.addSubview(lblNama)
        viewMain.addSubview(lblTgl)
        viewMain.addSubview(lblTelp)
        viewMain.addSubview(lblAlamat)
        viewMain.addSubview(lblProvinsi_)
        viewMain.addSubview(dropDown!)
        viewMain.addSubview(lblKota_)
        viewMain.addSubview(dropDownKota!)

        btnSimpan.frame = CGRect(x: view.frame.width * 0.1 , y: (viewMain.frame.origin.y) + (viewMain.frame.height) + 10, width: view.frame.width * 0.8, height: 35 )
        btnSimpan.setTitle("Simpan", for: .normal)
        btnSimpan.setTitleColor(UIColor.white, for: .normal)
        btnSimpan.buttonColor = UIColor(hex: "0080c1")
        btnSimpan.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        
        
        scrollView.addSubview(viewTop)
        scrollView.addSubview(viewMain)
        scrollView.addSubview(btnSimpan)
        
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
            
            self.btnSimpan.frame = CGRect(x: self.view.frame.width * 0.1 , y: (self.viewMain.frame.origin.y) + (self.viewMain.frame.height) + 20, width: self.view.frame.width * 0.8, height: 35 )
            
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
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func didSelectItem(dropDown: HADropDown, at index: Int) {
        print("Item selected at index \(index)")
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
