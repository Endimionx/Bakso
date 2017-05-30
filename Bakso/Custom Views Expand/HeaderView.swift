//
//  LabTransactionHeader.swift
//  SmartCardia
//
//  Created by Pramod Jadhav on 11/04/17.
//  Copyright © 2017 Pramod Jadhav. All rights reserved.
//

import UIKit
import JExpandableTableView

class HeaderView: JExpandableTableViewHV {

    @IBOutlet weak var arrowImgView: UIImageView!
    
    override func uiSetupForExpandedState() {
        arrowImgView.image = UIImage(named: "ic_arrow_up_black")
    }
    
    override func uiSetupForClosedState() {
        arrowImgView.image = UIImage(named: "ic_arrow_down_black")
    }
}
