//
//  ChildMenuComing.swift
//  Bakso
//
//  Created by Macbook on 5/15/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import Foundation
import XLPagerTabStrip

class ChildMenuComing: UIViewController, IndicatorInfoProvider {
    
    var itemInfo: IndicatorInfo = "View"
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let img = UIImage(named: "comingsoon")
        
        let w = view.frame.width * 0.8
        let w1 = img?.size.width
        let h1 = img?.size.height
        let h = (w / w1!) * h1!
        
        let imgView = UIImageView()
        imgView.image = img
        imgView.frame = CGRect(x: 0, y: (view.frame.height / 2) - (h / 2), width: w, height: h)
        //imgView.center.y = view.center.y
        imgView.center.x = view.center.x
     
        view.addSubview(imgView)
        view.backgroundColor = .white
        
        //view.addConstraint(NSLayoutConstraint(item: imgView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        //view.addConstraint(NSLayoutConstraint(item: imgView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: -50))
    }
    
    // MARK: - IndicatorInfoProvider
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
}

