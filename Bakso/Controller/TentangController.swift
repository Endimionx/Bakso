//
//  TentangController.swift
//  Bakso
//
//  Created by Macbook on 5/20/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class TentangController: UIViewController {

    var loader: UIActivityIndicatorView!
    var viewLoading:UIView!
    var syncLogo: UIImageView!
    var syncImage: UIImageView!
    
    
    var vMain = UIView()
    var imgApps = UIImageView()
    var lblNameApps = UILabel()
    var lblVersion = UILabel()
    var lblClient = UILabel()
    var lblAlamat_ = UILabel()
    var lblAlamat = UIVerticalAlignLabel()
    var lblTelp_ = UILabel()
    var lblTelp = UILabel()
    var lblEmail_ = UILabel()
    var lblEmail = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Tentang Aplikasi", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        view.backgroundColor = UIColor.white
        
        vMain.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.55)
        //vMain.backgroundColor = UIColor.groupTableViewBackground
        vMain.center.y = view.center.y
        
        
        imgApps.frame = CGRect(x: 0, y: 10, width: vMain.frame.width / 3, height:  vMain.frame.width / 3)
        imgApps.image = UIImage(named: "ic_apps")
        imgApps.center.x = vMain.center.x
        
        lblNameApps.frame = CGRect(x: 0, y: imgApps.frame.origin.y + imgApps.frame.width , width: view.frame.width, height: 20)
        lblNameApps.text = "J-Delivery"
        lblNameApps.font = UIFont.boldSystemFont(ofSize: 17)
        lblNameApps.textAlignment = .center
        lblNameApps.textColor = mainColor
        
        lblVersion.frame = CGRect(x: 0, y: imgApps.frame.origin.y + imgApps.frame.width + 20, width: view.frame.width, height: 20)
        lblVersion.text = "Version 1.0"
        lblVersion.font = UIFont.systemFont(ofSize: 13)
        lblVersion.textAlignment = .center
        lblVersion.textColor = UIColor.darkGray
        
        
        lblClient.frame = CGRect(x: 0, y: lblVersion.frame.origin.y + lblVersion.frame.height, width: view.frame.width, height: 20)
        //lblClient.text = "Pondok Bakso Pak Joko"
        lblClient.font = UIFont.boldSystemFont(ofSize: 17)
        lblClient.textAlignment = .center
        lblClient.textColor = UIColor.darkGray
        
        
        lblAlamat_.frame = CGRect(x: 10, y: lblClient.frame.origin.y + lblClient.frame.height + 5, width: view.frame.width - 20, height: 20)
        lblAlamat_.text = "Alamat"
        lblAlamat_.font = UIFont.boldSystemFont(ofSize: 12)
        lblAlamat_.textAlignment = .left
        lblAlamat_.textColor = UIColor.darkGray
        
        lblAlamat.frame = CGRect(x: 10, y: lblAlamat_.frame.origin.y + lblAlamat_.frame.height, width: view.frame.width - 20, height: 30)
        //lblAlamat.text = "Jl Bintaro Raya Selatan Blok S4 No1 Sektor 2 - Bintaro Jaya "
        lblAlamat.font = UIFont.systemFont(ofSize: 12)
        lblAlamat.textAlignment = .left
        lblAlamat.numberOfLines = 0
        lblAlamat.textColor = UIColor.darkGray
        
        lblTelp_.frame = CGRect(x: 10, y: lblAlamat.frame.origin.y + lblAlamat.frame.height + 5, width: view.frame.width - 20, height: 20)
        lblTelp_.text = "Telepon"
        lblTelp_.font = UIFont.boldSystemFont(ofSize: 12)
        lblTelp_.textAlignment = .left
        lblTelp_.textColor = UIColor.darkGray
        
        lblTelp.frame = CGRect(x: 10, y: lblTelp_.frame.origin.y + lblTelp_.frame.height, width: view.frame.width - 20, height: 20)
        //lblTelp.text = "021 503 307 60"
        lblTelp.font = UIFont.systemFont(ofSize: 12)
        lblTelp.textAlignment = .left
        lblTelp.numberOfLines = 0
        lblTelp.textColor = UIColor.darkGray
        
        lblEmail_.frame = CGRect(x: 10, y: lblTelp.frame.origin.y + lblTelp.frame.height + 5, width: view.frame.width - 20, height: 20)
        lblEmail_.text = "Email"
        lblEmail_.font = UIFont.boldSystemFont(ofSize: 12)
        lblEmail_.textAlignment = .left
        lblEmail_.textColor = UIColor.darkGray
        
        lblEmail.frame = CGRect(x: 10, y: lblEmail_.frame.origin.y + lblEmail_.frame.height, width: view.frame.width - 20, height: 20)
        //lblEmail.text = "support@baksopakjoko.com"
        lblEmail.font = UIFont.systemFont(ofSize: 12)
        lblEmail.textAlignment = .left
        lblEmail.numberOfLines = 0
        lblEmail.textColor = UIColor.darkGray
        
        
        vMain.addSubview(imgApps)
        vMain.addSubview(lblNameApps)
        vMain.addSubview(lblVersion)
        vMain.addSubview(lblClient)
        vMain.addSubview(lblAlamat_)
        vMain.addSubview(lblAlamat)
        vMain.addSubview(lblTelp_)
        vMain.addSubview(lblTelp)
        vMain.addSubview(lblEmail_)
        vMain.addSubview(lblEmail)
        
        
        view.addSubview(vMain)
        
        initLoading()
        
        startSpinning()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async(execute: { () -> Void in
            self.resizeToFitSubviewsScrollView()
            
            return
        })
        
    }
    
    func resizeToFitSubviewsScrollView() {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in vMain.subviews {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
            
        }
        self.vMain.frame.size = CGSize(width:vMain.frame.width, height: height + 20 )
    }
    
    
    func goBack(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    
    func initLoading(){
        
        viewLoading = UIView()
        viewLoading.frame = view.bounds
        viewLoading.backgroundColor = UIColor.groupTableViewBackground
        
        loader = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        loader.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        loader.center = view.center
        
        viewLoading.addSubview(loader)
        
        viewLoading.isHidden = true
        view.addSubview(viewLoading)
    }
    
    func startSpinning() {
        viewLoading.isHidden = false
        loader.startAnimating()
        
        viewLoading.isHidden = false
        
        getCompany()
        
    }
    
    func stopSpinning() {
        viewLoading.isHidden = true
        loader.stopAnimating()
    }
    
    func getCompany(){
        
        let URL_SAVE_TEAM = strServer + "get_company_by_id/1"
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var strQuery:String = ""
        
        let postParameters = strQuery
        
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            do {
                
                let myJSON = try JSONSerialization.jsonObject(with: data! as Data,  options:JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                print(myJSON)
                
                
                
                if let d = myJSON.value(forKey: "result") as? NSArray {
                    
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        if let d0 = d as? NSArray {
                            
                            for i in (0 ..< d0.count){
                                if let obj = d0[i]as? NSDictionary
                                {
                                    let company_name = obj["company_name"] as? String ?? ""
                                    let company_phone = obj["company_phone"]  as? String ?? ""
                                    let company_email = obj["company_email"]  as? String ?? ""
                                    let company_address = obj["company_address"]  as? String ?? ""
                                    let company_image = obj["company_image"]  as? String ?? ""
                                    
                                    
                                    self.lblClient.text = company_name
                                    self.lblTelp.text = company_phone
                                    self.lblAlamat.text = company_address
                                    self.lblEmail.text = company_email
                                    
                                }
                            }
                        }
                    
                        let t = self.lblAlamat.requiredHeight()
                        
                        self.lblAlamat.frame.size = CGSize(width: self.view.frame.width, height: t)
                        
                        self.lblTelp_.frame = CGRect(x: 10, y: self.lblAlamat.frame.origin.y + self.lblAlamat.frame.height + 5, width: self.view.frame.width - 20, height: 20)
                        
                        self.lblTelp.frame = CGRect(x: 10, y: self.lblTelp_.frame.origin.y + self.lblTelp_.frame.height, width: self.view.frame.width - 20, height: 20)
                        
                        self.lblEmail_.frame = CGRect(x: 10, y: self.lblTelp.frame.origin.y + self.lblTelp.frame.height + 5, width: self.view.frame.width - 20, height: 20)
                        
                        self.lblEmail.frame = CGRect(x: 10, y: self.lblEmail_.frame.origin.y + self.lblEmail_.frame.height, width: self.view.frame.width - 20, height: 20)
                        
                        
                        self.stopSpinning()
                        
                        
                    })
                    
                    
                }
                
                
                
                
                
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    

    

}
