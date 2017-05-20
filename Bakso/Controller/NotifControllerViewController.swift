//
//  NotifControllerViewController.swift
//  Bakso
//
//  Created by Macbook on 5/19/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class NotifControllerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,
UIGestureRecognizerDelegate {

    var tableView : UITableView?
    
    var dataHeader = ["Ini adalah Judul 1", "Ini adalah Judul 2", "Ini adalah Judul  3", "Ini adalah Judul " ]
    var dataDetail = ["Ini adalah keterangan 1", "Ini adalah keterangan 4", "Ini adalah keterangan 1", "Ini adalah keterangan  10"]
    var dataImg =  ["bakso1", "bakso2", "bakso3", "bakso4" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Notifikasi", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        
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
        
        
        let frame = CGRect(x: 0, y: l, width: view.frame.width, height: view.frame.height )
        tableView = UITableView()
        tableView?.frame = frame
        tableView?.rowHeight = 75
        tableView?.register(ItemNotifTableCell.self, forCellReuseIdentifier: "Cell")
        tableView?.separatorInset.left = 0
        tableView?.separatorInset.right = 0
        tableView?.delegate = self
        tableView?.dataSource = self
        
        view.addSubview(tableView!)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func goBack(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataHeader.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ItemNotifTableCell
        
        
        cell.lblNamaBakso.text = dataHeader[indexPath.row]
        cell.lblJumlah_.text = dataDetail[indexPath.row]
        
        let image = UIImage(named: dataImg[indexPath.row])
        cell.imgMenu.image = image
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    

}
