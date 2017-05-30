//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    case pembelian = 0
    case notifikasi = 1
    case kritik = 2
    case tanya = 3
    case tentang = 4
    case keluar = 5
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
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
    
    var pembelianController: UIViewController!
    var notifController: UIViewController!
    var kritikController: UIViewController!
    var tanyaController: UIViewController!
    var tentangController: UIViewController!
    var profileController: UIViewController!
    var faqController: UIViewController!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var loader: UIActivityIndicatorView!
        var viewLoading:UIView!
        var syncLogo: UIImageView!
        var syncImage: UIImageView!
        
        
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
         
        let pembelianController = storyboard.instantiateViewController(withIdentifier: "PembelianController") as! PembelianController
        self.pembelianController = UINavigationController(rootViewController: pembelianController)
        
        let notifController = storyboard.instantiateViewController(withIdentifier: "NotifController") as! NotifControllerViewController
        self.notifController = UINavigationController(rootViewController: notifController)
        
        let kritikController = storyboard.instantiateViewController(withIdentifier: "KritikController") as! KritikController
        self.kritikController = UINavigationController(rootViewController: kritikController)
        
        let tanyaController = storyboard.instantiateViewController(withIdentifier: "TanyaController") as! TanyaController
        self.tanyaController = UINavigationController(rootViewController: tanyaController)
        
        let tentangController = storyboard.instantiateViewController(withIdentifier: "TentangController") as! TentangController
        self.tentangController = UINavigationController(rootViewController: tentangController)
        
        let profileController = storyboard.instantiateViewController(withIdentifier: "ProfileController") as! ProfileController
        self.profileController = UINavigationController(rootViewController: profileController)
        
        let faqController = storyboard.instantiateViewController(withIdentifier: "FaqController") as! FaqController
        self.faqController = UINavigationController(rootViewController: faqController)
        
        
        
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
        
        let tap__:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(lihatProfile))
        tap__.delegate = self
        self.imageHeaderView.profileImage.isUserInteractionEnabled = true
        self.imageHeaderView.profileImage.addGestureRecognizer(tap__)
        
        let start = CGPoint(x: 20, y: self.imageHeaderView.frame.height - 15)
        let end = CGPoint(x: self.imageHeaderView.frame.width - 30, y: self.imageHeaderView.frame.height - 15)
        
        drawLineFromPoint(start: start, toPoint: end, ofColor: UIColor.white, inView: imageHeaderView)
        
        self.view.layoutIfNeeded()
    }
    
    func lihatProfile(){
        
        self.present(profileController, animated:true, completion: nil)
        self.closeLeft()
        self.closeRight()
        
    }
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
            case .pembelian:
                self.present(pembelianController, animated:true, completion: nil)
            case .notifikasi:
                self.present(notifController, animated:true, completion: nil)
            case .kritik:
                self.present(kritikController, animated:true, completion: nil)
            case .tanya:
                self.present(faqController, animated:true, completion: nil)
            case .tentang:
                self.present(tentangController, animated:true, completion: nil)
            case .keluar:
                self.slideMenuController()?.changeMainViewController(self.nonMenuViewController, close: true)
        }
        
        self.closeLeft()
        self.closeRight()
        
        
    }
    
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menus.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath) as! SlideCell
      
        cell.lblTitle.text = menus[indexPath.row]
        cell.imgTitle.image = UIImage(named : menusImg[indexPath.row])
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath as IndexPath)
        cell!.contentView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath as IndexPath)
        cell!.contentView.backgroundColor = mainColor
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            var selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
            //selectedCell.selectionStyle = .none
            //selectedCell.contentView.backgroundColor = mainColor // UIColor.blue.withAlphaComponent(0.2)
            self.changeViewController(menu)
        }
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
