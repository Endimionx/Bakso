//
//  ClassStruct.swift
//  Bakso
//
//  Created by Macbook on 5/25/17.
//  Copyright © 2017 KGN. All rights reserved.
//


import Foundation
import UIKit



struct itemReguler {
    
    var category_id:String
    var category_name:String
    var product_id:String
    var product_price:String
    var product_name:String
    var product_description:String
    var product_stat:String
    var product_status:String
    var product_thumb:String
    var product_image:String
    
    init(category_id:String ,category_name:String ,product_id:String ,product_price:String,product_name:String,product_description:String,product_stat:String,product_status:String,product_thumb:String,product_image:String) {
        
        
        self.category_id = category_id
        self.category_name = category_name
        self.product_id = product_id
        self.product_price = product_price
        self.product_name = product_name
        self.product_description = product_description
        self.product_stat = product_stat
        self.product_status = product_status
        self.product_thumb = product_thumb
        self.product_image = product_image
        
        
    }
    
    
}


struct itemFAQ {
    
    var faq_id:String
    var faq_question:String
    var faq_answer:String
    
    init(faq_id:String ,faq_question:String ,faq_answer:String ) {
        
        
        self.faq_id = faq_id
        self.faq_question = faq_question
        self.faq_answer = faq_answer
        
    }
    
    
}

