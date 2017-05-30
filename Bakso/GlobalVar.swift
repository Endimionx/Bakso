//
//  GlobalVar.swift
//  Bakso
//
//  Created by Macbook on 5/14/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import Foundation
import UIKit


let mainColor = UIColor(hex: "0080c1")
public var intFCm = 0
public var intRegister = 0
public var strServer = "http://bakso.narengga.com/api/"

func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
    
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = 1.5
    
    view.layer.addSublayer(shapeLayer)
}

func drawLineFromPointWithHeight(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
    
    let path = UIBezierPath()
    path.move(to: start)
    path.addLine(to: end)
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = path.cgPath
    shapeLayer.strokeColor = lineColor.cgColor
    shapeLayer.lineWidth = 0.5
    
    view.layer.addSublayer(shapeLayer)
}

func getRupiah(string: String) -> String? {
    
    var hasil:String = ""
    
    let terbayar = String(string)?.replacingOccurrences(of: ".00", with: "")
    let myInteger = Int(terbayar!)
    let myNumber = NSNumber(value: myInteger!)
    
    var currencyFormatter = NumberFormatter()
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle = NumberFormatter.Style.currency
    currencyFormatter.locale = NSLocale.current
    var priceString = currencyFormatter.string(from: myNumber)
    var hTerbayar = priceString?.replacingOccurrences(of: "$", with: "Rp ")
    
    return hTerbayar
    
}

public func stringFromHtml(string: String) -> NSAttributedString? {
    do {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        if let d = data {
            let str = try NSAttributedString(data: d,
                                             options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                                             documentAttributes: nil)
            return str
        }
    } catch {
    }
    return nil
}

