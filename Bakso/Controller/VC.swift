//
//  VC.swift
//  Bakso
//
//  Created by Macbook on 5/16/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class VC: UIViewController {
    
    @IBOutlet weak var txt: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.frame.size = CGSize(width: 200, height: 200)
        view.backgroundColor = UIColor.white
        
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


