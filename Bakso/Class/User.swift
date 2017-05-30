//
//  User.swift
//  Bakso
//
//  Created by Macbook on 5/25/17.
//  Copyright © 2017 KGN. All rights reserved.
//


import Foundation

public struct User{
    
    static func getCustomerId() -> String {
        return UserDefaults.standard.object(forKey: "customer_id") as! String
    }
    
    static func getCustomerDevice() -> String {
        return UserDefaults.standard.object(forKey: "customer_device") as! String
    }
    
    static func getCustomerSaldo() -> String {
        return UserDefaults.standard.object(forKey: "customer_saldo") as! String
    }
    
    static func getCustomerName() -> String {
        return UserDefaults.standard.object(forKey: "customer_name") as! String
    }
    
    static func getCustomerDob() -> String {
        return UserDefaults.standard.object(forKey: "customer_dob") as! String
    }
    
    static func getCustomerPhone() -> String {
        return UserDefaults.standard.object(forKey: "customer_phone") as! String
    }
    
    static func getCustomerEmail() -> String {
        return UserDefaults.standard.object(forKey: "customer_email") as! String
    }
    
    static func getCustomeraddress() -> String {
        return UserDefaults.standard.object(forKey: "customer_address") as! String
    }
    
    static func getCustomerDesc() -> String {
        return UserDefaults.standard.object(forKey: "customer_description") as! String
    }
    
    static func getCustomerStat() -> String {
        return UserDefaults.standard.object(forKey: "customer_stat") as! String
    }
    
    static func getCustomerStatus() -> String {
        return UserDefaults.standard.object(forKey: "customer_status") as! String
    }
    
    static func getCustomerProvId() -> String {
        return UserDefaults.standard.object(forKey: "province_id") as! String
    }
    
    static func getCustomerProvName() -> String {
        return UserDefaults.standard.object(forKey: "province_name") as! String
    }
    
    static func getCustomerCityId() -> String {
        return UserDefaults.standard.object(forKey: "city_id") as! String
    }
    
    static func getCustomerCityName() -> String {
        return UserDefaults.standard.object(forKey: "city_name") as! String
    }
    
    static func getCustomerDistrictId() -> String {
        return UserDefaults.standard.object(forKey: "district_id") as! String
    }
    
    static func getCustomerDistrictName() -> String {
        return UserDefaults.standard.object(forKey: "district_name") as! String
    }
    
    static func getCustomerSubDistrictId() -> String {
        return UserDefaults.standard.object(forKey: "subdistrict_id") as! String
    }
    
    static func getCustomerSubDistrictName() -> String {
        return UserDefaults.standard.object(forKey: "subdistrict_name") as! String
    }
    
    static func getCustomerThumb() -> String {
        return UserDefaults.standard.object(forKey: "customer_thumb") as! String
    }
    
    static func getCustomerImage() -> String {
        return UserDefaults.standard.object(forKey: "customer_image") as! String
    }
    
    static func logout(){
        
        let defaults = UserDefaults.standard
        
        defaults.set("", forKey: "core_user_id")
        defaults.set("", forKey: "username")
        defaults.set("", forKey: "tipe_user")
        defaults.set("", forKey: "urtipe")
        defaults.set("", forKey: "nama")
        defaults.set("", forKey: "jekel")
        defaults.set("", forKey: "urjekel")
        defaults.set("", forKey: "email")
        defaults.set("", forKey: "status_user")
        defaults.set("", forKey: "status_member")
        defaults.set("", forKey: "kode_member")
        defaults.set("", forKey: "status_agen")
        defaults.set("", forKey: "pertama")
        defaults.set("", forKey: "bank")
        defaults.set("", forKey: "no_rek")
        defaults.set("", forKey: "nama_rek")
        defaults.set("", forKey: "virtual_account")
        defaults.set("", forKey: "foto_profile")
        
        defaults.synchronize()
        
        
    }
    
    
    
    
}
