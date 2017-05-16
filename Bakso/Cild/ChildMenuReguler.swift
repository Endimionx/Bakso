//
//  ChildMenuReguler.swift
//  Bakso
//
//  Created by Macbook on 5/15/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import NYAlertViewController
import PopupDialog


class ChildMenuReguler: UIViewController, IndicatorInfoProvider, UICollectionViewDataSource, UICollectionViewDelegate   {

    var itemInfo: IndicatorInfo = "View"
    var collectionview : UICollectionView?
    
    
    var dataHeader = ["Bakso Rinegan", "Bakso Rasenggan", "Bakso Suriken", "Bakso Bunshin", "Bakso Kuchi Yose", "Bakso Hinata", "Bakso Bunshin", "Bakso Kuchi Yose", "Bakso Hinata" ]
    var dataHarga = ["Rp. 3.000.000", "Rp. 150.000", "Rp. 200.000", "Rp. 2.500.000", "Rp. 200.000", "Rp. 2.500.000" , "Rp. 2.500.000", "Rp. 200.000", "Rp. 2.500.000" ]
  
    var dataImg =  ["bakso1", "bakso2", "bakso3", "bakso4", "bakso5", "bakso6", "bakso1", "bakso2", "bakso3" ]
    var popup : PopupDialog!
    
    
    
    //===========
    let btnPembayaran =  CustomButton(type : UIButtonType.system)
    let btnKeranjang =  CustomButton(type : UIButtonType.system)
    //===========
    
    
    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let t = (view.frame.width - 15) / 2
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: t, height: t * 0.8)
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        //layout.sp
        collectionview = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionview?.delegate = self
        collectionview?.dataSource = self
        collectionview?.frame = CGRect(x: 5, y: 2, width: view.frame.width - 10, height: view.frame.height - 110)
        collectionview?.backgroundColor = UIColor.white
        collectionview?.register(MenuCell.self, forCellWithReuseIdentifier: "Cell")
        
        
        
        view.addSubview(collectionview!)
        view.backgroundColor = .white
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async(execute: { () -> Void in
            //self.resizeToFitSubviewsScrollView()
            return
        })
        
    }

    func resizeToFitSubviewsScrollView() {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in (collectionview?.subviews)! {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
            
        }
        self.collectionview?.contentSize = CGSize(width:0, height: height )
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! MenuCell
        
        cell.lblTitle.text = dataHeader[indexPath.row]
        cell.lblHarga.text = dataHarga[indexPath.row]
        cell.imgMenu.image = UIImage(named: dataImg[indexPath.row])
        
        return cell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //idWarung = DataWarung[indexPath.row].store_id
        
        showItem()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue!, sender: Any!) {
        //if (segue.identifier == "home_page") {
        //let navController = segue.destination as! UINavigationController
        //let detailController = navController.topViewController as! VCWarungDetail
        //detailController.slug = "haha"
        //}
    }
    
    func showItem(animated: Bool = true) {
        
        
        let ratingVC = VC(nibName: "RatingViewController", bundle: nil)
        
        popup = PopupDialog(viewController: ratingVC, buttonAlignment: .horizontal, transitionStyle: .bounceDown, gestureDismissal: true)
        
        let model = UIDevice.current.modelName
        var l:CGFloat = 0
        
        print("model = " + model)
        
        if(model == "4" || model == "4s" || model == "4g" || model == "5" || model == "5s" || model == "5g"){
            l = UIScreen.main.bounds.width * 1.05
        }else if(model == "iPad Mini 2" ){
            l = UIScreen.main.bounds.width * 1.03
        }else{
            l = UIScreen.main.bounds.width * 0.95
        }
        
        let v = UIView()
        v.frame = CGRect(x: 0, y: 0, width: popup.view.frame.width * 0.9, height: l)
        v.backgroundColor = UIColor.white
        
        
        var lblTitle = UILabel()
        lblTitle.frame = CGRect(x:10, y: 10, width: v.frame.width - 20, height: 30)
        lblTitle.text = "MENU"
        lblTitle.font = UIFont.boldSystemFont(ofSize: 13)
        lblTitle.textAlignment = .center
        lblTitle.textColor = UIColor.white
        lblTitle.backgroundColor = mainColor
        
        let vMain = UIView()
        vMain.frame = CGRect(x: 10, y: 40, width: v.frame.width - 20, height: 200)
        //vMain.backgroundColor = UIColor.groupTableViewBackground
        
        let heightImg = vMain.frame.width * 0.4
        let widthText = vMain.frame.width * 0.6
        
        let imgBakso = UIImageView()
        imgBakso.image = UIImage(named: "bakso1")
        imgBakso.frame = CGRect(x: 10, y: 5, width: heightImg - 20, height: heightImg - 20)
        
        var lblHarga = UILabel()
        lblHarga.frame = CGRect(x:0, y: heightImg - 20, width: heightImg , height: 25)
        lblHarga.text = "Rp 20,000"
        lblHarga.font = UIFont.boldSystemFont(ofSize: 11)
        lblHarga.textAlignment = .center
        lblHarga.textColor = UIColor.white
        lblHarga.backgroundColor = mainColor
        
        
        let btnMin = CustomButton(type : UIButtonType.system)
        btnMin.frame = CGRect(x: 0, y: lblHarga.frame.origin.y + lblHarga.frame.height + 5, width: 25, height: 25)
        btnMin.setTitle("-", for: .normal)
        btnMin.setTitleColor(UIColor.white, for: .normal)
        btnMin.buttonColor = UIColor.black
        btnMin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btnMin.layer.cornerRadius = btnMin.bounds.size.height / 2
        btnMin.clipsToBounds = true
        btnMin.layer.borderWidth = 1
        btnMin.layer.borderColor = UIColor.white.cgColor
        
        let btnPlus = CustomButton(type : UIButtonType.system)
        btnPlus.frame = CGRect(x: heightImg - 23 , y: lblHarga.frame.origin.y + lblHarga.frame.height + 5, width: 25, height: 25)
        btnPlus.setTitle("+", for: .normal)
        btnPlus.setTitleColor(UIColor.white, for: .normal)
        btnPlus.buttonColor = mainColor
        btnPlus.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btnPlus.layer.cornerRadius = btnMin.bounds.size.height / 2
        btnPlus.clipsToBounds = true
        btnPlus.layer.borderWidth = 1
        btnPlus.layer.borderColor = UIColor.white.cgColor
        
        let lblJumlah = UILabel()
        lblJumlah.frame = CGRect(x: btnMin.frame.width + 5, y: lblHarga.frame.origin.y + lblHarga.frame.height + 5, width: heightImg - 60 , height: 25)
        lblJumlah.text = "10"
        lblJumlah.font = UIFont.boldSystemFont(ofSize: 16)
        lblJumlah.textAlignment = .center
        lblJumlah.textColor = mainColor
        
        let lblNamaBakso = UILabel()
        lblNamaBakso.frame = CGRect(x: heightImg + 5, y: 5, width: widthText - 10 , height: 20)
        lblNamaBakso.text = "Bakso Campur Ranjau"
        lblNamaBakso.font = UIFont.boldSystemFont(ofSize: 12)
        lblNamaBakso.textAlignment = .left
        lblNamaBakso.textColor = mainColor
        
        let width = CGFloat(0.3)
        let border2 = CALayer()
        border2.borderColor = UIColor.darkGray.cgColor
        border2.frame = CGRect(x: 0, y: lblNamaBakso.frame.size.height - width, width: lblNamaBakso.frame.size.width, height: 1.5)
        border2.borderWidth = width
        lblNamaBakso.layer.addSublayer(border2)
        
        
        let lblDeskripsi = UIVerticalAlignLabel()
        lblDeskripsi.frame = CGRect(x: heightImg + 5, y: 30, width: widthText - 10 , height: btnMin.frame.origin.y + btnMin.frame.height - 30)
        lblDeskripsi.text = "Bakso Campur Ranjau merupakan kombinasi antara BAKSO URAT dengan BAKSO DAGING SUMANTO yang kami hidangkan dalam satu porsi yang dapat membuet lidah anda terbakar, bagaikan terbakar api asmara. Dan pedih pedas yang terasa sampai ke Akherat, akan tetapi tidak lebih pedas dari kehidupan seorang Ladur Cobain. Tiada tara..."
        lblDeskripsi.font = UIFont.systemFont(ofSize: 11)
        lblDeskripsi.numberOfLines = 0
        lblDeskripsi.textColor = UIColor.darkGray
        lblDeskripsi.textAlignment = .justified
        //lblDeskripsi.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        //let t = lblDesc.requiredHeight()
        //lblDesc.frame = CGRect(x: view.frame.width * 0.1, y: 120, width : view.frame.width * 0.8, height: t)
        
        let btnOrder = CustomButton(type : UIButtonType.system)
        btnOrder.frame = CGRect(x: 0 , y: btnPlus.frame.origin.y + btnPlus.frame.height + 10, width: vMain.frame.width , height: 35 )
        btnOrder.setTitle("ORDER", for: .normal)
        btnOrder.setTitleColor(UIColor.white, for: .normal)
        btnOrder.buttonColor = UIColor(hex: "dddddd")
        btnOrder.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        let btnCancel = CustomButton(type : UIButtonType.system)
        btnCancel.frame = CGRect(x: 0 , y: btnOrder.frame.origin.y + btnOrder.frame.height + 5, width: vMain.frame.width , height: 35 )
        btnCancel.setTitle("CANCEL", for: .normal)
        btnCancel.setTitleColor(UIColor.white, for: .normal)
        btnCancel.buttonColor = UIColor(hex: "666666")
        btnCancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
        
        
        vMain.addSubview(imgBakso)
        vMain.addSubview(lblHarga)
        vMain.addSubview(btnMin)
        vMain.addSubview(btnPlus)
        vMain.addSubview(lblJumlah)
        vMain.addSubview(lblNamaBakso)
        vMain.addSubview(lblDeskripsi)
        vMain.addSubview(btnOrder)
        vMain.addSubview(btnCancel)
        
        
        //===================================
        
      
        var width1: CGFloat = 0
        var height1: CGFloat = 0
        for someView in (vMain.subviews) {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width1 = max(width1, newWidth)
            height1 = max(height1, newHeight)
            
        }
        vMain.frame.size = CGSize(width: vMain.frame.width, height: height1 )
        
        v.addSubview(lblTitle)
        v.addSubview(vMain)
        
        
        
        v.center.y = popup.view.center.y
        v.center.x = popup.view.center.x
        
        for someView in (v.subviews) {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width1 = max(width1, newWidth)
            height1 = max(height1, newHeight)
            
        }
        v.frame.size = CGSize(width: v.frame.width, height: height1 + 10 )
        
        
        popup.view.addSubview(v)
        
        popup.hiddenContainer()
        popup.hiddenShadowContainer()
        
        
        
        
        present(popup, animated: false , completion: nil)
        

        
    }

    

}
