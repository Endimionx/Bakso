//
//  UIVerticalAlignLabel.swift
//  Bakso
//
//  Created by Macbook on 5/14/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit

class UIVerticalAlignLabel: UILabel {
    enum VerticalAlignment : Int {
        case VerticalAlignmentTop = 0
        case VerticalAlignmentMiddle = 1
        case VerticalAlignmentBottom = 2
    }
    
    @IBInspectable var verticalAlignment : VerticalAlignment = .VerticalAlignmentTop {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //required init?(coder aDecoder: NSCoder) {
    //    super.init(coder: aDecoder)
    //}
    
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines: Int) -> CGRect {
        let rect = super.textRect(forBounds: bounds, limitedToNumberOfLines: limitedToNumberOfLines)
        
        switch(verticalAlignment) {
        case .VerticalAlignmentTop:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y, width: rect.size.width, height: rect.size.height)
        case .VerticalAlignmentMiddle:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height) / 2, width: rect.size.width, height: rect.size.height)
        case .VerticalAlignmentBottom:
            return CGRect(x: bounds.origin.x, y: bounds.origin.y + (bounds.size.height - rect.size.height), width: rect.size.width, height: rect.size.height)
        }
    }
    
    override func drawText(in rect: CGRect) {
        let r = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: r)
    }
    
    func requiredHeight() -> CGFloat{
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = self.font
        label.text = self.text
        
        label.sizeToFit()
        
        return label.frame.height
    }
    
}
