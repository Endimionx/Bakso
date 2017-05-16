//
//  ChildMenuFrozen.swift
//  Bakso
//
//  Created by Macbook on 5/15/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChildMenuFrozen: UIViewController, IndicatorInfoProvider, UICollectionViewDataSource, UICollectionViewDelegate   {
    
    var itemInfo: IndicatorInfo = "View"
    var collectionview : UICollectionView?
    
    
    var dataHeader = ["Bakso Rinegan", "Bakso Rasenggan", "Bakso Suriken", "Bakso Bunshin", "Bakso Kuchi Yose", "Bakso Hinata", "Bakso Bunshin", "Bakso Kuchi Yose", "Bakso Hinata" ]
    var dataHarga = ["Rp. 3.000.000", "Rp. 150.000", "Rp. 200.000", "Rp. 2.500.000", "Rp. 200.000", "Rp. 2.500.000" , "Rp. 2.500.000", "Rp. 200.000", "Rp. 2.500.000" ]
    
    var dataImg =  ["bakso1", "bakso2", "bakso3", "bakso4", "bakso5", "bakso6", "bakso1", "bakso2", "bakso3" ]
    
    
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
        self.collectionview?.contentSize = CGSize(width:0, height: height  )
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
        
        //let vc = VCWarungDetail()
        //self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue!, sender: Any!) {
        //if (segue.identifier == "home_page") {
        //let navController = segue.destination as! UINavigationController
        //let detailController = navController.topViewController as! VCWarungDetail
        //detailController.slug = "haha"
        //}
    }
    
    
}
