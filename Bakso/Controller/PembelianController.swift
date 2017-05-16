//
//  PembelianController.swift
//  Bakso
//
//  Created by Macbook on 5/17/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class PembelianController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()
    
    var dataHeader = ["Sun, 10 Juli 2016", "Sun, 10 Juli 2016", "Sun, 11 Juli 2016", "Sun, 12 Juli 2016" ]
    var dataDetail = ["Mari wujudkan masyarakat yang gotong-royong dan berinvestasi", "Mari wujudkan masyarakat yang gotong-royong dan berinvestasi", "Mari wujudkan masyarakat yang gotong-royong dan berinvestasi", "Mari wujudkan masyarakat yang gotong-royong dan berinvestasi" ]
    var dataImg =  ["im_berita2", "im_berita", "im_menu", "im_menu" ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let px = 1 / UIScreen.main.scale
        let frame = CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: px)
        let line = UIView(frame: frame)
        self.tableView.tableHeaderView = line
        line.backgroundColor = self.tableView.separatorColor
        tableView.rowHeight = 75
        tableView.register(CustomCellProfile.self, forCellReuseIdentifier: "Cell")
        tableView.separatorInset.left = 0
        tableView.separatorInset.right = 0
        tableView.delegate = self
        tableView.dataSource = self
        
        
        view.addSubview(tableView)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dataHeader.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCellProfile
        
        
        cell.lblHeader.attributedText = stringFromHtml(string: dataHeader[indexPath.row])
        cell.lblDetail.attributedText = stringFromHtml(string: dataDetail[indexPath.row])
        
        let imageName = dataImg[indexPath.row]
        let image = UIImage(named: imageName)
        
     
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
    }
    

    

}
