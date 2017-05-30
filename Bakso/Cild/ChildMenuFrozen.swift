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
    
    var loader: UIActivityIndicatorView!
    var viewLoading:UIView!
    var syncLogo: UIImageView!
    var syncImage: UIImageView!
    
    var DataReguler:Array<itemReguler> = Array<itemReguler>()
    
    
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
        
        initLoading()
        
        self.startSpinning()
        
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
        
        return DataReguler.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("1 = " + DataReguler[indexPath.row].product_thumb)
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! MenuCell
        
        cell.lblTitle.text = DataReguler[indexPath.row].product_name // dataHeader[indexPath.row]
        cell.lblHarga.text = "Rp. " + getRupiah(string: DataReguler[indexPath.row].product_price)!.replacingOccurrences(of: ".00", with: "").replacingOccurrences(of: "IDR", with: "Rp. ")  // dataHarga[indexPath.row]
        cell.imgMenu.setImageByUrl(Int(cell.imgMenu.frame.width), height: Int(cell.imgMenu.frame.height), url_: String(DataReguler[indexPath.row].product_thumb)) //UIImage(named: dataImg[indexPath.row])
        
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
    
    func initLoading(){
        
        viewLoading = UIView()
        viewLoading.frame = view.bounds
        viewLoading.backgroundColor = UIColor.groupTableViewBackground
        
        loader = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        loader.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        loader.center = view.center
        
        viewLoading.addSubview(loader)
        
        viewLoading.isHidden = true
        view.addSubview(viewLoading)
    }
    
    func startSpinning() {
        viewLoading.isHidden = false
        loader.startAnimating()
        
        viewLoading.isHidden = false
        
        postData()
        
    }
    
    func stopSpinning() {
        viewLoading.isHidden = true
        loader.stopAnimating()
    }
    
    func postData(){
        
        let URL_SAVE_TEAM = strServer + "get_product_by_category"
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var strQuery:String = "category=2"
        
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
                
                print(myJSON)
                
                
                
                if let d = myJSON.value(forKey: "result") as? NSArray {
                    
                    if let d0 = d as? NSArray {
                        
                        for i in (0 ..< d0.count){
                            if let obj = d0[i]as? NSDictionary
                            {
                                let category_id = obj["category_id"] as? String ?? ""
                                let category_name = obj["category_name"]  as? String ?? ""
                                let product_id = obj["product_id"]  as? String ?? ""
                                let product_price = obj["product_price"]  as? String ?? ""
                                let product_name = obj["product_name"]  as? String ?? ""
                                let product_description = obj["product_description"]  as? String ?? ""
                                let product_stat = obj["product_stat"]  as? String ?? ""
                                let product_status = obj["product_status"]  as? String ?? ""
                                let product_thumb = obj["product_thumb"]  as? String ?? ""
                                let product_image = obj["product_image"]  as? String ?? ""
                                
                                let add_it = itemReguler(category_id:category_id ,category_name:category_name ,product_id:product_id ,product_price:product_price,product_name:product_name,product_description:product_description,product_stat:product_stat,product_status:product_status,product_thumb:product_thumb,product_image:product_image )
                                
                                
                                self.DataReguler.append(add_it)
                                
                            }
                        }
                    }
                    
                    
                }
                
                
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    self.collectionview?.reloadData()
                    self.stopSpinning()
                    
                    
                })
                
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
    
    

    
    
}
