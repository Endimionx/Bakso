//
//  LoginController.swift
//  Bakso
//
//  Created by Macbook on 5/15/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField
import SlideMenuControllerSwift


class LoginController: UIViewController, UIGestureRecognizerDelegate {

    var viewBG = UIImageView()
    var txtUsername = JVFloatLabeledTextField()
    var txtPassword = JVFloatLabeledTextField()
    var btnLogin = CustomButton(type : UIButtonType.system)
    var viewContainer = UIView()
    var viewRegister = UIView()
    var lblInfo = UILabel()
    var lblRegister = UILabel()
    
    
    var loader: UIActivityIndicatorView!
    var viewLoading:UIView!
    var syncLogo: UIImageView!
    var syncImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewBG.image = UIImage(named: "bg_login")
        viewBG.frame = CGRect(x: 0, y:0, width: view.frame.width, height: view.frame.height)
        view.addSubview(viewBG)
        
        
        viewContainer.frame = CGRect(x: view.frame.width * 0.1, y: 0, width: view.frame.width * 0.8, height: view.frame.height * 0.35)
        viewContainer.center.y = view.center.y
        
        let w = viewContainer.frame.width
        
        txtUsername.frame = CGRect(x: 5, y: 10 , width: w - 10, height: 30)
        txtUsername.keepBaseline = true
        txtUsername.floatingLabelYPadding = -10
        txtUsername.placeholder = "Email"
        txtUsername.textAlignment = .left
        txtUsername.isUserInteractionEnabled = true
        txtUsername.textColor = UIColor.white
        txtUsername.alwaysShowFloatingLabel = false
        txtUsername.floatingLabelTextColor = UIColor.white
        txtUsername.floatingLabelActiveTextColor = UIColor.white
        txtUsername.placeholderColor = UIColor.white
        txtUsername.setPlaceholder("Email", floatingTitle: "Email")
        txtUsername.text = "ladur.cobain@gmail.com"
        //txtUsername.addTarget(self, action: #selector(showPickerHari(sender:)), for: .editingDidBegin)
        
        let width = CGFloat(0.3)
        let border2 = CALayer()
        border2.borderColor = UIColor.white.cgColor
        border2.frame = CGRect(x: 0, y: txtUsername.frame.size.height - width, width: txtUsername.frame.size.width, height: 1)
        border2.borderWidth = width
        txtUsername.layer.addSublayer(border2)
        
        
        txtPassword.frame = CGRect(x: 5, y: 60 , width: w - 10, height: 30)
        txtPassword.keepBaseline = true
        txtPassword.floatingLabelYPadding = -10
        txtPassword.placeholder = "Password"
        txtPassword.textAlignment = .left
        txtPassword.isUserInteractionEnabled = true
        txtPassword.textColor = UIColor.white
        txtPassword.alwaysShowFloatingLabel = false
        txtPassword.floatingLabelTextColor = UIColor.white
        txtPassword.floatingLabelActiveTextColor = UIColor.white
        txtPassword.placeholderColor = UIColor.white
        txtPassword.setPlaceholder("Password", floatingTitle: "Password")
        txtPassword.text = "qweasd"
        //txtUsername.addTarget(self, action: #selector(showPickerHari(sender:)), for: .editingDidBegin)
        
        let border22 = CALayer()
        border22.borderColor = UIColor.white.cgColor
        border22.frame = CGRect(x: 0, y: txtPassword.frame.size.height - width, width: txtPassword.frame.size.width, height: 1)
        border22.borderWidth = width
        txtPassword.layer.addSublayer(border22)
        
        btnLogin.frame = CGRect(x: viewContainer.frame.width * 0.1 , y: 120, width: viewContainer.frame.width * 0.8, height: 35 )
        btnLogin.setTitle("LOGIN", for: .normal)
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnLogin.buttonColor = UIColor(hex: "0080c1")
        btnLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btnLogin.addTarget(self, action: #selector(startSpinning), for: .touchUpInside)
        
        
        viewRegister.frame = CGRect(x: (viewContainer.frame.width - 190) / 2, y: 170, width: 180, height: 40)
        
        
        lblInfo.frame = CGRect(x: 0, y: 5, width: 125, height: 30)
        lblInfo.text = "Belum mempunyai akun ?"
        lblInfo.font = UIFont.systemFont(ofSize: 10)
        lblInfo.textAlignment = .right
        lblInfo.textColor = UIColor.white
        
        lblRegister.frame = CGRect(x: 130, y: 5, width: 65, height: 30)
        lblRegister.text = "Daftar di sini"
        lblRegister.font = UIFont.systemFont(ofSize: 10)
        lblRegister.textAlignment = .left
        lblRegister.textColor = UIColor.blue
        lblRegister.isUserInteractionEnabled = true
        
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goRegister))
        tap.delegate = self
        lblRegister.addGestureRecognizer(tap)
        
        viewRegister.addSubview(lblInfo)
        viewRegister.addSubview(lblRegister)
        
        
        viewContainer.addSubview(txtUsername)
        viewContainer.addSubview(txtPassword)
        viewContainer.addSubview(btnLogin)
        viewContainer.addSubview(viewRegister)
        
        
        view.addSubview(viewContainer)
        
        
        self.initLoading()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func goRegister(){
        
        print("Register")
        performSegue(withIdentifier: "go_register", sender: nil)
        
    }
    
    func goHome(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let leftViewController = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as! LeftViewController
        let rightViewController = storyboard.instantiateViewController(withIdentifier: "RightViewController") as! RightViewController
        
        let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
        
       
        leftViewController.mainViewController = nvc
        
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        slideMenuController.changeLeftViewWidth(view.frame.width * 0.8)
        self.present(slideMenuController, animated: true, completion: nil)
     
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
   
        postData()
        
    }
    
    func stopSpinning() {
        viewLoading.isHidden = true
        loader.stopAnimating()
    }
    
    func postData(){
        
        let token = "c4DwMM0MJeE:APA91bHEJ3nW4eKtUMsIq5osOOqlrHtHS02iPibfeaDDb6oYHEcqyupdzxNb8g0RGydV6xzvuy_NinUIY16gNMBKf0HXCeC2ylU3MUA64kcZdVWf6mpeIuejzuxAicXmyzEOXOFJMuGT" //FIRInstanceID.instanceID().token()
        
        let URL_SAVE_TEAM = strServer + "get_login_customer"
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var strQuery:String = ""
        strQuery += "email=" + (self.txtUsername.text?.lowercased())!
        strQuery += "&password=" + (txtPassword.text?.lowercased())!
        strQuery += "&device=" + token
        
        
        let postParameters = strQuery
        
        
        print(postParameters)
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            do {
                
                let myJSON = try JSONSerialization.jsonObject(with: data! as Data,  options:JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                
                let resultStatus = myJSON.value(forKey: "status") as? Int ?? 0
                
                print(myJSON)
                
                if(resultStatus == 1){
                    
                    if let d = myJSON.value(forKey: "result") as? NSArray {
                        
                        print(d)
                        
                        if let d0 = d[0] as? NSDictionary {
                         
                            let defaults = UserDefaults.standard
                                
                            defaults.set(d0["customer_id"] as? String ?? "", forKey: "customer_id")
                            defaults.set(d0["customer_device"] as? String ?? "", forKey: "customer_device")
                            defaults.set(d0["customer_saldo"] as? String ?? "", forKey: "customer_saldo")
                            defaults.set(d0["customer_name"] as? String ?? "", forKey: "customer_name")
                            defaults.set(d0["customer_dob"] as? String ?? "", forKey: "customer_dob")
                            defaults.set(d0["customer_phone"] as? String ?? "", forKey: "customer_phone")
                            defaults.set(d0["customer_email"] as? String ?? "", forKey: "customer_email")
                            defaults.set(d0["customer_address"] as? String ?? "", forKey: "customer_address")
                            defaults.set(d0["customer_description"] as? String ?? "", forKey: "customer_description")
                            defaults.set(d0["customer_stat"] as? String ?? "", forKey: "customer_stat")
                            defaults.set(d0["customer_status"] as? String ?? "", forKey: "customer_status")
                            defaults.set(d0["province_id"] as? String ?? "", forKey: "province_id")
                            defaults.set(d0["province_name"] as? String ?? "", forKey: "province_name")
                            defaults.set(d0["city_id"] as? String ?? "", forKey: "city_id")
                            defaults.set(d0["city_name"] as? String ?? "", forKey: "city_name")
                            defaults.set(d0["district_id"] as? String ?? "", forKey: "district_id")
                            defaults.set(d0["district_name"] as? String ?? "", forKey: "district_name")
                            defaults.set(d0["subdistrict_id"] as? String ?? "", forKey: "subdistrict_id")
                            defaults.set(d0["subdistrict_name"] as? String ?? "", forKey: "subdistrict_name")
                            defaults.set(d0["customer_thumb"] as? String ?? "", forKey: "customer_thumb")
                            defaults.set(d0["customer_image"] as? String ?? "", forKey: "customer_image")
                            
                            defaults.synchronize()
                                
                            
                            DispatchQueue.main.async(execute: { () -> Void in
                                self.stopSpinning()
                                self.goHome()
                                
                            })
                        }
                    }
                    
                    
                }else{
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.stopSpinning()
                        let alert =  UIAlertView(title: "Info", message: "Login gagal, silahkan cek username atau password Anda", delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
                        
                    })
                    
                    
                }
                
                
                
                DispatchQueue.main.async(execute: { () -> Void in
                    self.stopSpinning()
                    
                    
                })
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    

    

}
