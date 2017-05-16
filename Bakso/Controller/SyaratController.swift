//
//  SyaratController.swift
//  Bakso
//
//  Created by Macbook on 5/15/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class SyaratController: UIViewController {

    var lblTitle = UILabel()
    var lblDesc = UIVerticalAlignLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = "Syarat dan Ketentuan"
        view.backgroundColor = UIColor.white
        
        
        
        
        lblTitle.frame = CGRect(x: 10, y: 75, width: view.frame.width, height: 40)
        lblTitle.text = "Lorem Ipsum dolor sit amet"
        lblTitle.font = UIFont.boldSystemFont(ofSize: 18)
        lblTitle.textColor = UIColor.darkGray
        lblTitle.textAlignment = .center
        
        
        lblDesc.frame = CGRect(x: view.frame.width * 0.1, y: 130, width : view.frame.width * 0.8, height: view.frame.height)
        lblDesc.text = "Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem \n\rIpsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit \n\ramet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet \n\ramet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet Lorem Ipsum dolor sit amet  "
        lblDesc.numberOfLines = 0
        lblDesc.textColor = UIColor.darkGray
        lblDesc.textAlignment = .justified
        lblDesc.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        lblDesc.textAlignment = .justified
        lblDesc.font = UIFont.systemFont(ofSize: 13)
        let t = lblDesc.requiredHeight()
        lblDesc.frame = CGRect(x: view.frame.width * 0.1, y: 120, width : view.frame.width * 0.8, height: t)
        
        
        view.addSubview(lblTitle)
        view.addSubview(lblDesc)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
