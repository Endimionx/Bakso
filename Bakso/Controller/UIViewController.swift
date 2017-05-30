//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    
    public func buttonBadge() -> MIBadgeButton? {
        
        let buttonCart = MIBadgeButton()
        buttonCart.setImage(UIImage(named: "ic_slide_shop"), for: UIControlState.normal)
        buttonCart.frame = CGRect(x: 0, y: 0, width: 31, height: 31)
        buttonCart.badgeString = "9"
        buttonCart.badgeBackgroundColor = UIColor.red
        buttonCart.badgeEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 7)
        buttonCart.addTarget(self, action: #selector(goPesanx), for: UIControlEvents.touchUpInside)
        
        return buttonCart
    }
    
    func setNavigationBarItem() {
        
        self.addLeftBarButtonWithImageText(UIImage(named: "ic_menu_black_24dp")!)
        //self.addRightBarButtonBadge()
        //self.addRightBarButtonWithImage(UIImage(named: "ic_slide_shop")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
    func setNavigationBarItemBack() {
        self.addLeftBarButtonWithImageTextBack(UIImage(named: "ic_arrow")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func setBadgeString(tot: String){
        
        self.setBadgeString(total: tot)
        
    
    }
    
    func goPesanx(){
        
        print("pesan")
    }
    
    func setRightButton(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonBadge()!)
        
    }
    
    func setUpdateRightButton(){
        
        //print(buttonBadge()?.badgeLabel.text! ?? "")
        buttonBadge()?.setBadgeString = "99"
    }
    
    
    func changeTitle(){
        
        self.navigationItem.leftBarButtonItem?.title = "adadadada"
    }
}
