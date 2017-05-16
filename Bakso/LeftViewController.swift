//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case swift
    case java
    case go
    case nonMenu
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Pembelian", "Notifikasi", "Kritik dan Saran", "Tanya Jawab", "Tentang Aplikasi", "Keluar"]
    var menusImg = ["ic_slide_shop", "ic_slide_notif", "ic_slide_questions", "ic_slide_help", "ic_slide_info", "ic_slide_lock"]
    
    var mainViewController: UIViewController!
    var swiftViewController: UIViewController!
    var javaViewController: UIViewController!
    var goViewController: UIViewController!
    var nonMenuViewController: UIViewController!
    var imageHeaderView: ImageHeaderView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let swiftViewController = storyboard.instantiateViewController(withIdentifier: "SwiftViewController") as! SwiftViewController
        self.swiftViewController = UINavigationController(rootViewController: swiftViewController)
        
        let javaViewController = storyboard.instantiateViewController(withIdentifier: "JavaViewController") as! JavaViewController
        self.javaViewController = UINavigationController(rootViewController: javaViewController)
        
        let goViewController = storyboard.instantiateViewController(withIdentifier: "GoViewController") as! GoViewController
        self.goViewController = UINavigationController(rootViewController: goViewController)
        
        let nonMenuController = storyboard.instantiateViewController(withIdentifier: "NonMenuController") as! NonMenuController
        nonMenuController.delegate = self
        self.nonMenuViewController = UINavigationController(rootViewController: nonMenuController)
 
        tableView.rowHeight     = 40
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.separatorStyle = .none
        self.tableView.register(SlideCell.self, forCellReuseIdentifier: "Cells")
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
        
         
        self.view.backgroundColor = UIColor(hex: "0080c1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
        
        let start = CGPoint(x: 20, y: self.imageHeaderView.frame.height - 15)
        let end = CGPoint(x: self.imageHeaderView.frame.width - 30, y: self.imageHeaderView.frame.height - 15)
        
        drawLineFromPoint(start: start, toPoint: end, ofColor: UIColor.white, inView: imageHeaderView)
        
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .swift:
            self.slideMenuController()?.changeMainViewController(self.swiftViewController, close: true)
        case .java:
            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
        case .go:
            self.slideMenuController()?.changeMainViewController(self.goViewController, close: true)
        case .nonMenu:
            self.slideMenuController()?.changeMainViewController(self.nonMenuViewController, close: true)
        }
    }
    
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menus.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath) as! SlideCell
      
        cell.lblTitle.text = menus[indexPath.row]
        cell.imgTitle.image = UIImage(named : menusImg[indexPath.row])
        
        return cell
    }

    
}





//
//extension LeftViewController : UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if let menu = LeftMenu(rawValue: indexPath.row) {
//            switch menu {
//            case .main, .swift, .java, .go, .nonMenu:
//                return BaseTableViewCell.height()
//            }
//        }
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let menu = LeftMenu(rawValue: indexPath.row) {
//            self.changeViewController(menu)
//        }
//    }
//    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if self.tableView == scrollView {
//            
//        }
//    }
//}
//
//extension LeftViewController : UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return menus.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if let menu = LeftMenu(rawValue: indexPath.row) {
//            switch menu {
//            case .main, .swift, .java, .go, .nonMenu:
//                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
//                cell.setData(menus[indexPath.row])
//                return cell
//            }
//        }
//        return UITableViewCell()
//    }
//    
//    
//}
