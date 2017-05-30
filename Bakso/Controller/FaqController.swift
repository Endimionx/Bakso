//
//  FaqController.swift
//  Bakso
//
//  Created by Macbook on 5/26/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import JExpandableTableView
import SVProgressHUD

class FaqController: UIViewController,JExpandableTableViewDataSource, JExpandableTableViewDelegate {
    
    var dataArray = [SectionInfo]()
    @IBOutlet weak var jtableView: JExpandableTableView!
    
    var loader: UIActivityIndicatorView!
    var viewLoading:UIView!
    var syncLogo: UIImageView!
    var syncImage: UIImageView!
    
    var DataFaq:Array<itemFAQ> = Array<itemFAQ>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "ic_arrow"), for: .normal)
        button.setTitle("   Tanya Jawab", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        button.sizeToFit()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        
        
        jtableView.frame = view.frame
        jtableView.delegate = self
        jtableView.dataSource = self
        jtableView.keepPreviousCellExpanded = true
        jtableView.disableCellSeparator  = false
        jtableView.disableFooter = true

        
        var celNib = UINib.init(nibName: "ImageCell", bundle: nil)
        jtableView.register(celNib, forCellReuseIdentifier: "ImageCell")
        celNib = UINib.init(nibName: "TextCell", bundle: nil)
        jtableView.register(celNib, forCellReuseIdentifier: "TextCell")
        
        let headerNib = UINib.init(nibName: "HeaderView", bundle: nil)
        jtableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "HeaderView")
        
        initLoading()
        
        self.startSpinning()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: JExpandableTableView, numberOfRowsInSection section: Int, callback:  @escaping (Int) -> Void) {
        
        let sectionInfo = self.dataArray[section]
        if sectionInfo.cells.count != 0 {
            callback(sectionInfo.cells.count)
        }else{
            
            tableView.isUserInteractionEnabled = false
            SVProgressHUD.show(withStatus: "Loading chapters...")
            
            DispatchQueue.global().async {
                
                Thread.sleep(forTimeInterval: 2)
                DispatchQueue.main.sync {
                    tableView.isUserInteractionEnabled = true
                    SVProgressHUD.dismiss()
                    let sectionInfo = self.dataArray[section]
                    sectionInfo.cells.append(CellInfo("1. Prologue ",cellId: "TextCell"))
                    sectionInfo.cells.append(CellInfo("2. Bran I",cellId: "TextCell"))
                    sectionInfo.cells.append(CellInfo("3. Catelyn I",cellId: "TextCell"))
                    sectionInfo.cells.append(CellInfo("4. Daenerys I",cellId: "TextCell"))
                    sectionInfo.cells.append(CellInfo("5.  A Game of Thrones, very very long chapter beyond the wall",cellId: "TextCell"))
                    
                    callback(sectionInfo.cells.count)
                }
            }
        }
    }
    
    func tableView(_ tableView: JExpandableTableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let section = self.dataArray[indexPath.section]
        let row = section.cells[indexPath.row]
        
        let cellId = row.cellId
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId!, for: indexPath)
        
        cell.contentView.backgroundColor = UIColor.white
        let label = cell.viewWithTag(11) as? UILabel
        label?.text = row.text
        return cell
    }
    
    func numberOfSections(in tableView: JExpandableTableView) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: JExpandableTableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let section = self.dataArray[section]
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView")
        header?.contentView.backgroundColor = UIColor.groupTableViewBackground
        let label = header?.viewWithTag(11) as? UILabel
        label?.text = section.title
        
        
        
    
        return header
    }
    
    // Needed only if you want to show cells expanded on first load, JExpandableTableView will show cells expanded if this method returns number of cells greater than zero and current section have cells more than zero
    func tableView(_ tableView: JExpandableTableView, initialNumberOfRowsInSection section: Int) -> Int{
        
        if section == 0  {
            let section = self.dataArray[section]
            return section.cells.count
        }else{
            return 0
        }
    }
    
    
    func goBack(){
        
        self.navigationController?.dismiss(animated: true, completion: nil)
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
        
        let URL_SAVE_TEAM = strServer + "get_faq_all"
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        request.httpMethod = "POST"
        
        var strQuery:String = ""
        
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
                                let faq_id = obj["faq_id"] as? String ?? ""
                                let faq_question = obj["faq_question"]  as? String ?? ""
                                let faq_answer = obj["faq_answer"]  as? String ?? ""
                                
                                
                                let add_it = itemFAQ(faq_id:faq_id, faq_question:faq_question, faq_answer:faq_answer  )
                                
                                var cellInfo = CellInfo("Game of thrones",cellId: "TextCell")
                                
                                let sec = SectionInfo(faq_question)
                                cellInfo = CellInfo(faq_answer, cellId: "TextCell")
                                sec.cells.append(cellInfo)
                                
                                
                                self.dataArray.append(sec)
                                
                                
                                self.DataFaq.append(add_it)
                                
                            }
                        }
                    }
                    
                    
                }
                
                
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    
                    self.jtableView.realoadData()
                    
                    self.stopSpinning()
                    
                    
                })
                
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    
    

    
    
}
