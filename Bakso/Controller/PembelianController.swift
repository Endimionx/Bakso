//
//  PembelianController.swift
//  Bakso
//
//  Created by Macbook on 5/17/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class PembelianController: UIViewController, UITableViewDataSource, UITableViewDelegate,
UIGestureRecognizerDelegate {

    var tableView : UITableView?
    var txtDesc : UITextView?
    var scrollView = UIScrollView()
    var btnNext = CustomButton(type : UIButtonType.system)
    
    var dataHeader = ["Sun, 10 Juli 2016", "Sun, 10 Juli 2016", "Sun, 11 Juli 2016", "Sun, 12 Juli 2016" ]
    var dataDetail = ["2", "4", "1", "10"]
    var dataImg =  ["bakso1", "bakso2", "bakso3", "bakso4" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let model = UIDevice.current.modelName
        var l:CGFloat = 0
        
        print("model = " + model)
        
        if(model == "4" || model == "4s" || model == "4g" || model == "5" || model == "5s" || model == "5g"){
            l = 0
        }else if(model == "iPad Mini 2" ){
            l = 70
        }else{
            l = 0
        }
        
        view.backgroundColor = UIColor.white
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Pembelian", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        let frame = CGRect(x: 0, y: l, width: view.frame.width, height: ((view.frame.height / 4) * 3) - l)
        tableView = UITableView()
        tableView?.frame = frame
        //tableView?.translatesAutoresizingMaskIntoConstraints = true
        tableView?.rowHeight = 75
        tableView?.register(ItemTableCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorInset.left = 0
        tableView?.separatorInset.right = 0
        tableView?.delegate = self
        tableView?.dataSource = self
        
        let y = ((view.frame.height / 4) * 3) + 10
        print(String(describing: y))
        
        let start = CGPoint(x: 5, y: y)
        let end = CGPoint(x: self.view.frame.width - 5, y: y)
        
        drawLineFromPointWithHeight(start: start, toPoint: end, ofColor: UIColor.darkText, inView: view)
        
        
        txtDesc = UITextView()
        txtDesc?.frame = CGRect(x: 5, y: y + 10, width: view.frame.width - 10, height: (((view.frame.height - y) / 4) * 3) - 25)
        txtDesc?.text = "Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi Pemesanan Deskripsi "
        txtDesc?.layer.borderColor = UIColor.groupTableViewBackground.cgColor
        txtDesc?.layer.borderWidth = 1
        
        
        
        btnNext.frame = CGRect(x: 0 , y: (txtDesc?.frame.origin.y)! + (txtDesc?.frame.height)! + 5, width: view.frame.width * 0.8, height: 35 )
        btnNext.setTitle("Lanjut", for: .normal)
        btnNext.setTitleColor(UIColor.white, for: .normal)
        btnNext.buttonColor = UIColor(hex: "0080c1")
        btnNext.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btnNext.center.x = scrollView.center.x
        btnNext.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        
        view.addSubview(tableView!)
        view.addSubview(txtDesc!)
        view.addSubview(btnNext)
        
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemTableCell
        
        
        cell.lblNamaBakso.text = dataHeader[indexPath.row]
        cell.lblJumlah.text = dataDetail[indexPath.row]
        
        let image = UIImage(named: dataImg[indexPath.row])
        cell.imgMenu.image = image
        
     
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    

    func goBack(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

    func goNext(){
        
        let vc = PembayaranController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
