//
//  ViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit
import SlideMenuControllerSwift
import XLPagerTabStrip

class MainViewController: ButtonBarPagerTabStripViewController, logOutHandler {
    func updateCart() {
        
        
    }

    @IBOutlet weak var viewHead: UIView!

    let longTitleLabel = UILabel()
    var buttonCart = MIBadgeButton()
    var isReload = false
   
    var mainContens = ["data1", "data2", "data3", "data4", "data5", "data6", "data7", "data8", "data9", "data10", "data11", "data12", "data13", "data14", "data15"]
    
    var pemesananController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonCart = MIBadgeButton()
        buttonCart.setImage(UIImage(named: "ic_slide_shop"), for: UIControlState.normal)
        buttonCart.frame = CGRect(x: 0, y: 0, width: 31, height: 31)
        buttonCart.badgeString = "0"
        buttonCart.badgeBackgroundColor = UIColor.red
        buttonCart.badgeEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 7)
        buttonCart.addTarget(self, action: #selector(goPesan), for: UIControlEvents.touchUpInside)
        
        let notif = UIBarButtonItem(customView: buttonCart)
        
        //self.navigationItem.rightBarButtonItems = [notif]
        
        self.setRightButton()
        
//        let button_ = UIButton(type: .system)
//        button_.setImage(UIImage(named: "ic_slide_shop"), for: .normal)
//        button_.setTitle("", for: .normal)
//        button_.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        button_.addTarget(self, action: #selector(goPesan), for: .touchUpInside)
//        button_.sizeToFit()
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button_)
        
        
        // set up style before super view did load is executed
        settings.style.buttonBarBackgroundColor = UIColor(hex: "0080c1")
        settings.style.selectedBarBackgroundColor = UIColor(hex: "c8e8ff")
        //settings.style.buttonBarItemsWidth = Int(self.view.frame.width / CGFloat(5))
        
        
        longTitleLabel.text = "J-Delivery"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        longTitleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
        
        buttonBarView.removeFromSuperview()
        //navigationController?.navigationBar.addSubview(buttonBarView)
        
        buttonBarView.backgroundColor = UIColor(hex: "0080c1")
        self.viewHead.backgroundColor = UIColor(hex: "0080c1")
        self.viewHead.addSubview(buttonBarView)
        
        //postDataGetCart()
        
        
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
        self.setNavigationBarItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = ChildMenuReguler(itemInfo: "MENU REGULER")
        let child_2 = ChildMenuFrozen(itemInfo: "FROZEN FOOD")
        let child_3 = ChildBeverages(itemInfo: "BEVERAGES")
        let child_4 = ChildSnack(itemInfo: "SNACK")
        let child_5 = ChildMenuComing(itemInfo: "COMING SOON")
        
        guard isReload else {
            return [child_1, child_2, child_3, child_4, child_5]
        }
        
        var childViewControllers = [child_1, child_2, child_3, child_4, child_5]
        
        for (index, _) in childViewControllers.enumerated(){
            let nElements = childViewControllers.count - index
            let n = (Int(arc4random()) % nElements) + index
            if n != index{
                swap(&childViewControllers[index], &childViewControllers[n])
            }
        }
        let nItems = 1 + (arc4random() % 5)
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
    
    func goPesan(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pemesananController = storyboard.instantiateViewController(withIdentifier: "PemesananController") as! PemesananController
        self.pemesananController = UINavigationController(rootViewController: pemesananController)
        
        let vc = PemesananController()
        //self.navigationController?.pushViewController(vc, animated: true)
        
        //self.present(pemesananController,animated: true, completion: nil)
        
        print("Register")
        performSegue(withIdentifier: "go_pemesanan", sender: nil)
        
    }

    func updateCart(total: String){
        
        //postDataGetCart()
       
        //buttonCart.badgeString = total
        //longTitleLabel.text = total
        //self.navigationItem.leftBarButtonItem?.title = total
        
        //self.changeTitle()
        //buttonBadge()?.badgeString = "87"
        self.setUpdateRightButton()
        print("getTotalCart \(total)")
    }
    
    func postDataGetCart(){
        
        let URL_SAVE_TEAM = strServer + "get_total_cart_by_customer"
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var strQuery:String = "customer=" + User.getCustomerId()
        
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
          
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    var status = myJSON["status"] as! Int
                    
                    if (status == 1){
                        
                        let message = myJSON["message"] as! Int
                        
                        print("set Bagde = \(message)")
                        //self.buttonCart.badgeString = String(message)
                        self.setBadgeString(tot: String(message))
                        
                    }
                   
                    
                })
               
                
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
    

    
    
}


protocol logOutHandler {
    func updateCart()
}

extension MainViewController : SlideMenuControllerDelegate {
    
    func leftWillOpen() {
        print("SlideMenuControllerDelegate: leftWillOpen")
    }
    
    func leftDidOpen() {
        print("SlideMenuControllerDelegate: leftDidOpen")
    }
    
    func leftWillClose() {
        print("SlideMenuControllerDelegate: leftWillClose")
    }
    
    func leftDidClose() {
        print("SlideMenuControllerDelegate: leftDidClose")
    }
    
    func rightWillOpen() {
        print("SlideMenuControllerDelegate: rightWillOpen")
    }
    
    func rightDidOpen() {
        print("SlideMenuControllerDelegate: rightDidOpen")
    }
    
    func rightWillClose() {
        print("SlideMenuControllerDelegate: rightWillClose")
    }
    
    func rightDidClose() {
        print("SlideMenuControllerDelegate: rightDidClose")
    }
}
