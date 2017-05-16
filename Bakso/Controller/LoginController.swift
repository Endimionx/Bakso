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
        btnLogin.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        
        
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
        
        UINavigationBar.appearance().tintColor = UIColor(hex: "0080c1")
        
        leftViewController.mainViewController = nvc
        
        
        let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController, rightMenuViewController: rightViewController)
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        slideMenuController.delegate = mainViewController
        slideMenuController.changeLeftViewWidth(view.frame.width * 0.8)
        self.present(slideMenuController, animated: true, completion: nil)
        
        UITabBar.appearance().tintColor = UIColor(hex: "0080c1") //UIColor.white
        UINavigationBar.appearance().backgroundColor = UIColor(hex: "0080c1")
        UINavigationBar.appearance().titleTextAttributes =  [NSForegroundColorAttributeName: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor(hex: "0080c1")
        UINavigationBar.appearance().tintColor = UIColor.white
        
    }

}
