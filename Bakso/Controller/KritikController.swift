//
//  KritikController.swift
//  Bakso
//
//  Created by Macbook on 5/19/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class KritikController: UIViewController {

    var loader: UIActivityIndicatorView!
    var viewLoading:UIView!
    var syncLogo: UIImageView!
    var syncImage: UIImageView!
    
    
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
        btnKirim.addTarget(self, action: #selector(startSpinning), for: .touchUpInside)
        
        view.addSubview(viewTop)
        view.addSubview(txtDesc!)
        view.addSubview(btnKirim)
        
        
        initLoading()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        postDataFeedback()
        
    }
    
    
    func stopSpinning() {
        viewLoading.isHidden = true
        loader.stopAnimating()
    }
    
    func postDataFeedback(){
        
        
        let sUrl = "set_feedback"
        
        let URL_SAVE_TEAM = strServer + sUrl
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var strQuery:String = ""
        strQuery += "customer=" + User.getCustomerId()
        strQuery += "&description=" + (txtDesc?.text)!
        
        
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
                
                
                
                let result = myJSON["status"] as! Int
                let message = myJSON["message"] as! String
                
                if (result == 1){
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        let alert =  UIAlertView(title: "Info", message: message , delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                        self.stopSpinning()
                        self.txtDesc?.text = ""
                        
                    })
                    
                }else{
                    
                    DispatchQueue.main.async(execute: { () -> Void in
                        
                        let alert =  UIAlertView(title: "Info", message: message , delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                        
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
