//
//  TanyaController.swift
//  Bakso
//
//  Created by Macbook on 5/20/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import YNExpandableCell

class TanyaController: UIViewController, YNTableViewDelegate {
    @IBOutlet var ynTableView: YNTableView!
    @IBOutlet var expandAllButton: UIBarButtonItem!
    @IBOutlet var collapseAllButton: UIBarButtonItem!
    
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
        
        
        let cells = ["YNExpandableCellEx","YNSliderCell","YNSegmentCell"]
        self.ynTableView.registerCellsWith(nibNames: cells, and: cells)
        self.ynTableView.registerCellsWith(cells: [UITableViewCell.self as AnyClass], and: ["YNNonExpandableCell"])
        self.ynTableView.tableFooterView = UIView()
        self.ynTableView.ynDelegate = self
        self.ynTableView.ynTableViewRowAnimation = .top
        self.ynTableView.frame.size = CGSize(width: view.frame.width, height: view.frame.height)
        
        
        
        initLoading()
        
        self.startSpinning()
        
        
//        self.expandAllButton.action = #selector(self.expandAllButtonClicked)
//        self.expandAllButton.target = self
//        self.collapseAllButton.action = #selector(self.collapseAllButtonClicked)
//        self.collapseAllButton.target = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func expandAllButtonClicked() {
        self.ynTableView.expandAll()
    }
    
    func collapseAllButtonClicked() {
        self.ynTableView.collapseAll()
    }
    
    func tableView(_ tableView: YNTableView, expandCellWithHeightAt indexPath: IndexPath) -> YNTableViewCell? {
        
        let ynSegmentCell = YNTableViewCell()
        ynSegmentCell.cell = tableView.dequeueReusableCell(withIdentifier: YNSegmentCell.ID) as! YNSegmentCell
        
        let l = UIVerticalAlignLabel()
        l.frame = CGRect(x: 30, y: 5, width: self.ynTableView.frame.width - 50, height: 100)
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = UIColor.darkGray
        l.textAlignment = .justified
        l.numberOfLines = 0
        l.text = DataFaq[indexPath.row].faq_answer
        l.sizeToFit()
        
        let t = l.requiredHeight()
        
        l.frame.size = CGSize(width : l.frame.width, height: t)
        
        ynSegmentCell.cell?.addSubview(l)
        
        ynSegmentCell.height = t + 10
        
        return ynSegmentCell
       
    }
    
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let expandableCell = tableView.dequeueReusableCell(withIdentifier: YNExpandableCellEx.ID) as! YNExpandableCellEx
        
        print(DataFaq[indexPath.row].faq_question)
        
        expandableCell.titleLabel.text = DataFaq[indexPath.row].faq_question
    
        
        return expandableCell
        
    }
    
    func tableView(_ tableView: YNTableView, didSelectRowAt indexPath: IndexPath, isExpandableCell: Bool, isExpandedCell: Bool) {
        print("Selected Section: \(indexPath.section) Row: \(indexPath.row) isExpandableCell: \(isExpandableCell) isExpandedCell: \(isExpandedCell)")
    }
    
    func tableView(_ tableView: YNTableView, didDeselectRowAt indexPath: IndexPath, isExpandableCell: Bool, isExpandedCell: Bool) {
        print("Deselected Section: \(indexPath.section) Row: \(indexPath.row) isExpandableCell: \(isExpandableCell) isExpandedCell: \(isExpandedCell)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return DataFaq.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Section 0"
//        } else if section == 1 {
//            return "Section 1"
//        } else if section == 2 {
//            return "Section 2"
//        }
//        return ""
//    }
    
    
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
                                
                                
                                self.DataFaq.append(add_it)
                                
                            }
                        }
                    }
                    
                    
                }
                
                
                
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    self.ynTableView.reloadData()
                    self.stopSpinning()
                    
                    
                })
                
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    }
    

    
    
}

