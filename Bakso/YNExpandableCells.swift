//
//  YNExpandableCells.swift
//  YNExpandableCell
//
//  Created by YiSeungyoun on 2017. 3. 14..
//  Copyright © 2017년 SeungyounYi. All rights reserved.
//

import YNExpandableCell
import UIKit

class YNExpandableCellEx: YNExpandableCell {
    static let ID = "YNExpandableCellEx"
    static let lblDesc = UILabel()
    
    
    @IBOutlet var titleLabel: UILabel!

    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class YNSliderCell: UITableViewCell {
    static let ID = "YNSliderCell"
    static var lblDesc = UILabel()
    
    @IBOutlet weak var lbl: UITextView!
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        lbl.text = "ahai"
    }
    
}

class YNSegmentCell: UITableViewCell {
    static let ID = "YNSegmentCell"
    let lblDesc = UILabel()
    
    @IBOutlet var lblInfo: UILabel!
   
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
     
    
    }
    

}
