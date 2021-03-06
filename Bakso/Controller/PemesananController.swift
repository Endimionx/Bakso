//
//  PemesananController.swift
//  Bakso
//
//  Created by Macbook on 5/22/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift
import XLPagerTabStrip

class PemesananController: ButtonBarPagerTabStripViewController {
    
    var viewH = UIView()
    
    var isReload = false
    
    var mainContens = ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10", "data11", "data12", "data13", "data14", "data15"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up style before super view did load is executed
        settings.style.buttonBarBackgroundColor = UIColor(hex: "0080c1")
        settings.style.selectedBarBackgroundColor = UIColor(hex: "c8e8ff")
        settings.style.buttonBarItemsWidth = Int(self.view.frame.width / CGFloat(2))
        
        buttonBarView.removeFromSuperview()
        
        viewH.frame = CGRect(x: 0, y: 64, width: view.frame.width, height: 40)
        viewH.backgroundColor = UIColor(hex: "0080c1")
        viewH.addSubview(buttonBarView)
        
        view.addSubview(viewH)
        
        
        buttonBarView.backgroundColor = UIColor(hex: "0080c1")
        
        
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = UIColor(white: 1, alpha: 0.6)
            newCell?.label.textColor = .white
            
            if animated {
                UIView.animate(withDuration: 0.1, animations: { () -> Void in
                    newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                    oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }
            else {
                newCell?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                oldCell?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.setNavigationBarItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = ChildNotif(itemInfo: "NOTIF PEMESANAN")
        let child_2 = ChildMenuFrozen(itemInfo: "SELESAI")
        
        guard isReload else {
            return [child_1, child_2]
        }
        
        var childViewControllers = [child_1, child_2]
        
        for (index, _) in childViewControllers.enumerated(){
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index{
                swap(&childViewControllers[index], &childViewControllers[n])
            }
        }
        let nItems = 1 + (arc4random() % 3)
        return Array(childViewControllers.prefix(Int(nItems)))
    }
    
    override func reloadPagerTabStripView() {
        isReload = true
        if arc4random() % 2 == 0 {
            pagerBehaviour = .progressive(skipIntermediateViewControllers: arc4random() % 2 == 0, elasticIndicatorLimit: arc4random() % 2 == 0 )
        }
        else {
            pagerBehaviour = .common(skipIntermediateViewControllers: arc4random() % 2 == 0)
        }
        super.reloadPagerTabStripView()
    }
    
    override func configureCell(_ cell: ButtonBarViewCell, indicatorInfo: IndicatorInfo) {
        super.configureCell(cell, indicatorInfo: indicatorInfo)
        cell.backgroundColor = .clear
    }
    
    func goBack(){
        
        self.navigationController?.popViewController(animated: true)
    }
}

