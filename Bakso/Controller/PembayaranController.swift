//
//  PembayaranController.swift
//  Bakso
//
//  Created by Macbook on 5/17/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import GoogleMaps


class PembayaranController: UIViewController, UITableViewDataSource, UITableViewDelegate, HADropDownDelegate, UIGestureRecognizerDelegate, GMSMapViewDelegate, CLLocationManagerDelegate {
   
    var tableView : UITableView?
    var txtDesc : UITextView?
    var scrollView = UIScrollView()
    var btnPesan = CustomButton2(type : UIButtonType.system)
   
    var dropDown: HADropDown?
    
    
    var dataHeader = ["Bakso Rinegan", "Bakso Byakughan", "Bakso Mokuton Spesial", "Bakso Susano'o" ]
    var dataDetail = ["2", "4", "1", "10"]
    var dataHarga = ["Rp. 2,0000", "Rp. 40,000", "Rp. 10,000", "Rp. 100,000"]
    
    var dataImg =  ["bakso1", "bakso2", "bakso3", "bakso4" ]
    
    var mapView : GMSMapView?
    var locationManager = CLLocationManager()
    
    var london: GMSMarker?
    var londonView: UIImageView?
    
    var txtSearch = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let model = UIDevice.current.modelName
        var l:CGFloat = 0
        
        print("model = " + model)
        
        if(model == "4" || model == "4s" || model == "4g" || model == "5" || model == "5s" || model == "5g"){
            l = 10
        }else if(model == "iPad Mini 2" ){
            l = 70
        }else{
            l = 10
        }
        
        view.backgroundColor = UIColor.white
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Pembayaran", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        let frame = CGRect(x: 10, y: l, width: view.frame.width - 20, height: ((view.frame.height / 2) ) - l)
        tableView = UITableView()
        tableView?.frame = frame
        //tableView?.backgroundColor = UIColor.yellow
        tableView?.rowHeight = 40
        tableView?.register(ItemBayarTableCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorInset.left = 0
        tableView?.separatorInset.right = 0
        tableView?.separatorStyle = .none
        tableView?.delegate = self
        tableView?.dataSource = self
        
        let y = (view.frame.height / 2)  + 10
        print(String(describing: y))
        
        let start = CGPoint(x: 5, y: y)
        let end = CGPoint(x: self.view.frame.width - 5, y: y)
        
        drawLineFromPointWithHeight(start: start, toPoint: end, ofColor: UIColor.darkText, inView: view)
        
        let lblDes = UILabel()
        lblDes.frame = CGRect(x: 10 , y: y + 5 , width: 100, height: 20 )
        lblDes.text = "Deskripsi : "
        lblDes.font = UIFont.systemFont(ofSize: 10)
        lblDes.textColor = UIColor.darkGray
        
        let lblOngkir = UILabel()
        lblOngkir.frame = CGRect(x: 10 , y: y + 25, width: 100, height: 20 )
        lblOngkir.text = "Ongkir : Rp. 0"
        lblOngkir.font = UIFont.boldSystemFont(ofSize: 11)
        lblOngkir.textColor = UIColor.darkGray
        
        let lblTotal = UILabel()
        lblTotal.frame = CGRect(x: 10 , y: y + 40, width: 100, height: 20 )
        lblTotal.text = "Total : Rp. 20,000 "
        lblTotal.font = UIFont.boldSystemFont(ofSize: 11)
        lblTotal.textColor = UIColor.darkGray
        
        let lbl = UILabel()
        lbl.frame = CGRect(x: view.frame.width - 110 , y: y + 10, width: 100, height: 20 )
        lbl.text = "Metode Pembayaran"
        lbl.font = UIFont.systemFont(ofSize: 10)
        lbl.textColor = UIColor.darkGray
        
        dropDown = HADropDown()
        dropDown?.frame =  CGRect(x: view.frame.width - 110 , y: y + 30, width: 100, height: 25 )
        dropDown?.title = "Pilih"
        dropDown?.items = ["Cash", "EDC", "ATM"]
        dropDown?.titleFontSize = 12
        dropDown?.itemFontSize = 12
        dropDown?.font = UIFont.systemFont(ofSize: 12)
        dropDown?.itemBackground = UIColor.groupTableViewBackground
        dropDown?.backgroundColor = UIColor.groupTableViewBackground
        dropDown?.delegate = self
       
       
        let fMap = CGRect(x: 0, y: (dropDown?.frame.origin.y)! + (dropDown?.frame.height)! + 5, width: view.frame.width , height: (view.frame.height -  (dropDown?.frame.origin.y)! + (dropDown?.frame.height)! + 5 ) )
        
        let camera = GMSCameraPosition.camera(withLatitude: 51.5, longitude: -0.127, zoom: 14)
        
        mapView = GMSMapView.map(withFrame: fMap, camera: camera)
        mapView?.accessibilityElementsHidden = false
        mapView?.isMyLocationEnabled = true
        mapView?.settings.compassButton = true;
        mapView?.settings.myLocationButton = true;
        mapView?.delegate = self
        
        let position = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.127)
        let marker = GMSMarker(position: position)
        marker.title = "London"
        marker.icon = UIImage(named: "ic_navigate")
        marker.tracksViewChanges = true
        marker.map = mapView
        marker.isDraggable = true
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        txtSearch.frame = CGRect(x: 10, y: (mapView?.frame.origin.y)! + 10, width : view.frame.width - 20, height: 30)
        
        txtSearch.layer.shadowColor = UIColor.darkGray.cgColor
        txtSearch.layer.cornerRadius = 2
        txtSearch.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        txtSearch.layer.shadowOpacity = 0.5
        txtSearch.layer.shadowRadius = 1
        txtSearch.layer.borderColor = UIColor.darkGray.cgColor
        txtSearch.clipsToBounds = false
        
        btnPesan.frame = CGRect(x: view.frame.width * 0.1 , y: view.frame.height - 45, width: view.frame.width * 0.8, height: 35 )
        btnPesan.setTitle("Pesan Sekarang", for: .normal)
        btnPesan.setTitleColor(UIColor.white, for: .normal)
        btnPesan.buttonColor = UIColor(hex: "0080c1")
        btnPesan.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        
        let im = UIImageView()
        im.image = UIImage(named: "ic_search")
        im.frame = CGRect(x: (txtSearch.frame.origin.x + txtSearch.frame.width) - 30, y: txtSearch.frame.origin.y + 5, width: 20, height: 20)
        im.tintColor = UIColor.darkGray
        
        
        view.addSubview(tableView!)
        view.addSubview(lblOngkir)
        view.addSubview(lblTotal)
        view.addSubview(lblDes)
        view.addSubview(lbl)
        view.addSubview(dropDown!)
        view.addSubview(mapView!)
        view.addSubview(txtSearch)
        view.addSubview(im)
        view.addSubview(btnPesan)
        
        
        let tap__:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap__.delegate = self
        view.addGestureRecognizer(tap__)
        
        //view.addSubview(scrollView)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DispatchQueue.main.async(execute: { () -> Void in
            self.resizeToFitSubviewsScrollView()
            
            return
        })
        
    }
    
    func resizeToFitSubviewsScrollView() {
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        for someView in scrollView.subviews {
            let aView = someView
            let newWidth = aView.frame.origin.x + aView.frame.width
            let newHeight = aView.frame.origin.y + aView.frame.height
            width = max(width, newWidth)
            height = max(height, newHeight)
            
        }
        self.scrollView.contentSize = CGSize(width:0, height: height + 5 )
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.setNavigationBarItemBack()
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataHeader.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemBayarTableCell
        
        cell.lblNomer.text = String(indexPath.row + 1) + "."
        cell.lblNamaBakso.text = dataHeader[indexPath.row]
        cell.lblJumlah.text = "( " + dataDetail[indexPath.row] + " )"
        cell.lblHarga.text = dataHarga[indexPath.row]
     
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    
    func didSelectItem(dropDown: HADropDown, at index: Int) {
        print("Item selected at index \(index)")
    }
    
    
    func goBack(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}



