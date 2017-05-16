//
//  RegisterController.swift
//  Bakso
//
//  Created by Macbook on 5/15/17.
//  Copyright © 2017 KGN. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField
import GoogleMaps

class RegisterController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate, UIGestureRecognizerDelegate {

    var scrollView = UIScrollView()
    var imgLogo = UIImageView()
    var txtNama = JVFloatLabeledTextField()
    var txtEmail = JVFloatLabeledTextField()
    var txtPassword = JVFloatLabeledTextField()
    var txtNoTlp = JVFloatLabeledTextField()
    var txtPassword2 = JVFloatLabeledTextField()
    var txtAlamat = JVFloatLabeledTextField()
    var btnRegister = CustomButton(type : UIButtonType.system)
    var btnCancel = CustomButton(type : UIButtonType.system)
    
    var lblSyarat = UILabel()
    
    
    var mapView : GMSMapView?
    var locationManager = CLLocationManager()

    var london: GMSMarker?
    var londonView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "", style: .plain, target: nil, action: nil)
        
        let btnLeftMenu = UIButton()
        btnLeftMenu.setImage(UIImage(named: "ic_back"), for: UIControlState.normal)
        btnLeftMenu.frame = CGRect(x: -20, y: 0, width: 48, height: 48)
        btnLeftMenu.addTarget(self, action: #selector(onClcikBack), for: UIControlEvents.touchUpInside)
        
        //self.navigationItem.leftBarButtonItem =  UIBarButtonItem(customView: btnLeftMenu)
        

        scrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        imgLogo.image = UIImage(named: "ic_apps")
        imgLogo.frame = CGRect(x: 0, y: 20, width: 70, height: 70)
        imgLogo.center.x = scrollView.center.x
        
        let width = CGFloat(0.3)
        let w = view.frame.width
        let space = 40
        let start = 100
        let height_ = 30
        let width_ = Int(w - 60)
        
        txtNama.frame = CGRect(x: 30, y: start , width: width_, height: height_)
        txtNama.keepBaseline = true
        txtNama.floatingLabelYPadding = -5
        txtNama.font = UIFont.systemFont(ofSize: 14)
        txtNama.placeholder = "Nama"
        txtNama.textAlignment = .left
        txtNama.isUserInteractionEnabled = true
        txtNama.textColor = UIColor.darkGray
        txtNama.alwaysShowFloatingLabel = false
        txtNama.floatingLabelTextColor = UIColor.darkGray
        txtNama.floatingLabelActiveTextColor = UIColor.darkGray
        txtNama.placeholderColor = UIColor.darkGray
        txtNama.setPlaceholder("Nama", floatingTitle: "Nama")
       
        
        let border = CALayer()
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: txtNama.frame.size.height - width, width: txtNama.frame.size.width, height: 1)
        border.borderWidth = width
        txtNama.layer.addSublayer(border)
        
        
        txtEmail.frame = CGRect(x: 30, y: start + (space * 1) , width: width_, height: height_)
        txtEmail.keepBaseline = true
        txtEmail.floatingLabelYPadding = -5
        txtEmail.font = UIFont.systemFont(ofSize: 14)
        txtEmail.placeholder = "Email"
        txtEmail.textAlignment = .left
        txtEmail.isUserInteractionEnabled = true
        txtEmail.textColor = UIColor.darkGray
        txtEmail.alwaysShowFloatingLabel = false
        txtEmail.floatingLabelTextColor = UIColor.darkGray
        txtEmail.floatingLabelActiveTextColor = UIColor.darkGray
        txtEmail.placeholderColor = UIColor.darkGray
        txtEmail.setPlaceholder("Email", floatingTitle: "Email")
        
        
        let border1 = CALayer()
        border1.borderColor = UIColor.darkGray.cgColor
        border1.frame = CGRect(x: 0, y: txtEmail.frame.size.height - width, width: txtEmail.frame.size.width, height: 1)
        border1.borderWidth = width
        txtEmail.layer.addSublayer(border1)
        
        
        txtNoTlp.frame = CGRect(x: 30, y: start + (space * 2) , width: width_, height: height_)
        txtNoTlp.keepBaseline = true
        txtNoTlp.floatingLabelYPadding = -5
        txtNoTlp.font = UIFont.systemFont(ofSize: 14)
        txtNoTlp.placeholder = "No Telepon"
        txtNoTlp.textAlignment = .left
        txtNoTlp.isUserInteractionEnabled = true
        txtNoTlp.textColor = UIColor.darkGray
        txtNoTlp.alwaysShowFloatingLabel = false
        txtNoTlp.floatingLabelTextColor = UIColor.darkGray
        txtNoTlp.floatingLabelActiveTextColor = UIColor.darkGray
        txtNoTlp.placeholderColor = UIColor.darkGray
        txtNoTlp.setPlaceholder("No Telepon", floatingTitle: "No Telepon")
        
        
        let border2 = CALayer()
        border2.borderColor = UIColor.darkGray.cgColor
        border2.frame = CGRect(x: 0, y: txtNoTlp.frame.size.height - width, width: txtNoTlp.frame.size.width, height: 1)
        border2.borderWidth = width
        txtNoTlp.layer.addSublayer(border2)
        
        
        txtPassword.frame = CGRect(x: 30, y: start + (space * 3) , width: width_, height: height_)
        txtPassword.keepBaseline = true
        txtPassword.floatingLabelYPadding = -5
        txtPassword.font = UIFont.systemFont(ofSize: 14)
        txtPassword.placeholder = "Password"
        txtPassword.textAlignment = .left
        txtPassword.isUserInteractionEnabled = true
        txtPassword.textColor = UIColor.darkGray
        txtPassword.alwaysShowFloatingLabel = false
        txtPassword.floatingLabelTextColor = UIColor.darkGray
        txtPassword.floatingLabelActiveTextColor = UIColor.darkGray
        txtPassword.placeholderColor = UIColor.darkGray
        txtPassword.setPlaceholder("Password", floatingTitle: "Password")
        
        
        let border3 = CALayer()
        border3.borderColor = UIColor.darkGray.cgColor
        border3.frame = CGRect(x: 0, y: txtPassword.frame.size.height - width, width: txtPassword.frame.size.width, height: 1)
        border3.borderWidth = width
        txtPassword.layer.addSublayer(border3)
        
        
        txtPassword2.frame = CGRect(x: 30, y: start + (space * 4) , width: width_, height: height_)
        txtPassword2.keepBaseline = true
        txtPassword2.floatingLabelYPadding = -5
        txtPassword2.font = UIFont.systemFont(ofSize: 14)
        txtPassword2.placeholder = "Ulangi Password"
        txtPassword2.textAlignment = .left
        txtPassword2.isUserInteractionEnabled = true
        txtPassword2.textColor = UIColor.darkGray
        txtPassword2.alwaysShowFloatingLabel = false
        txtPassword2.floatingLabelTextColor = UIColor.darkGray
        txtPassword2.floatingLabelActiveTextColor = UIColor.darkGray
        txtPassword2.placeholderColor = UIColor.darkGray
        txtPassword2.setPlaceholder("Ulangi Password", floatingTitle: "Ulangi Password")
        
        
        let border4 = CALayer()
        border4.borderColor = UIColor.darkGray.cgColor
        border4.frame = CGRect(x: 0, y: txtPassword2.frame.size.height - width, width: txtPassword2.frame.size.width, height: 1)
        border4.borderWidth = width
        txtPassword2.layer.addSublayer(border4)
        
        
        txtAlamat.frame = CGRect(x: 30, y: start + (space * 5) , width: width_, height: height_)
        txtAlamat.keepBaseline = true
        txtAlamat.floatingLabelYPadding = -5
        txtAlamat.font = UIFont.systemFont(ofSize: 14)
        txtAlamat.placeholder = "Alamat"
        txtAlamat.textAlignment = .left
        txtAlamat.isUserInteractionEnabled = true
        txtAlamat.textColor = UIColor.darkGray
        txtAlamat.alwaysShowFloatingLabel = false
        txtAlamat.floatingLabelTextColor = UIColor.darkGray
        txtAlamat.floatingLabelActiveTextColor = UIColor.darkGray
        txtAlamat.placeholderColor = UIColor.darkGray
        txtAlamat.setPlaceholder("Alamat", floatingTitle: "Alamat")
        
        
        let border5 = CALayer()
        border5.borderColor = UIColor.darkGray.cgColor
        border5.frame = CGRect(x: 0, y: txtAlamat.frame.size.height - width, width: txtAlamat.frame.size.width, height: 1)
        border5.borderWidth = width
        txtAlamat.layer.addSublayer(border5)
      
        
        let fMap = CGRect(x: 30, y: start + (space * 6), width: width_, height: (space * 4) )
        
        let camera = GMSCameraPosition.camera(withLatitude: 51.5, longitude: -0.127, zoom: 14)
        
        mapView = GMSMapView.map(withFrame: fMap, camera: camera)
        mapView?.accessibilityElementsHidden = false
        mapView?.isMyLocationEnabled = true
        mapView?.settings.compassButton = true;
        mapView?.settings.myLocationButton = true;
        mapView?.delegate = self
        
        
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        
        
        let house = UIImage(named: "ic_navigate")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: house)
        markerView.tintColor = .red
        londonView = markerView
        
        let position = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.127)
        let marker = GMSMarker(position: position)
        marker.title = "London"
        marker.icon = UIImage(named: "ic_navigate") //GMSMarker.markerImage(with: .blue)
        marker.tracksViewChanges = true
        marker.map = mapView
        marker.isDraggable = true
        //marker.iconView = markerView
        //marker.opacity = 0.6
        //marker.isFlat = true
        
        
        
        lblSyarat.frame = CGRect(x: 30, y: start + (space * 10) + 10, width: width_, height: height_ )
        lblSyarat.text = "Syarat dan Ketentuan"
        lblSyarat.textColor = UIColor.blue
        lblSyarat.textAlignment = .center
        lblSyarat.font = UIFont.systemFont(ofSize: 12)
        lblSyarat.isUserInteractionEnabled = true
        
        let tap :UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goSyarat))
        tap.delegate = self
        lblSyarat.addGestureRecognizer(tap)
        
        
        btnRegister.frame = CGRect(x: 0 , y: start + (space * 11) + 10, width: Int(Double(width_) * 0.8), height: 35 )
        btnRegister.setTitle("Daftar", for: .normal)
        btnRegister.setTitleColor(UIColor.white, for: .normal)
        btnRegister.buttonColor = UIColor(hex: "0080c1")
        btnRegister.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btnRegister.center.x = scrollView.center.x
        //btnRegister.addTarget(self, action: #selector(goRegister), for: .touchUpInside)
        
        btnCancel.frame = CGRect(x: 0 , y: start + (space * 12) + 10, width: Int(Double(width_) * 0.8), height: 35 )
        btnCancel.setTitle("Batal", for: .normal)
        btnCancel.setTitleColor(UIColor.white, for: .normal)
        btnCancel.buttonColor = UIColor(hex: "0080c1")
        btnCancel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        btnCancel.center.x = scrollView.center.x
        btnCancel.addTarget(self, action: #selector(onClcikBack), for: .touchUpInside)
        
        
        scrollView.addSubview(imgLogo)
        scrollView.addSubview(txtNama)
        scrollView.addSubview(txtEmail)
        scrollView.addSubview(txtNoTlp)
        scrollView.addSubview(txtPassword)
        scrollView.addSubview(txtPassword2)
        scrollView.addSubview(txtAlamat)
        scrollView.addSubview(mapView!)
        scrollView.addSubview(lblSyarat)
        scrollView.addSubview(btnRegister)
        scrollView.addSubview(btnCancel)
        
        
        view.addSubview(scrollView)
        
        
        // Do any additional setup after loading the view.
    }

  
    func onClcikBack()
    {
        print("back")
        self.dismiss(animated: true, completion: nil)
        //self.navigationController?.popViewController(animated: true)
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
        self.scrollView.contentSize = CGSize(width:0, height: height + 80 )
    }
    
    //Location Manager delegates
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last
        
        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)
        
        self.mapView?.animate(to: camera)
        
        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()
        
    }
    
    
    func mapView(mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        UIView.animate(withDuration: 5.0, animations: { () -> Void in
            self.londonView?.tintColor = .blue
        }, completion: {(finished) in
            // Stop tracking view changes to allow CPU to idle.
            self.london?.tracksViewChanges = false
        })
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
      
        let longitude :CLLocationDegrees = marker.position.longitude
        let latitude :CLLocationDegrees = marker.position.latitude
        
        let location = CLLocation(latitude: latitude, longitude: longitude) //changed!!!
        
        CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
            print(location)
 
            if error != nil {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                //let pm = placemarks?[0] as! CLPlacemark
                //var placeMark: CLPlacemark!
                //placeMark = placemarks?[0]

                if let placemark = placemarks?.last
                    , let addrList = placemark.addressDictionary?["FormattedAddressLines"] as? [String]
                {
                    let address =  addrList.joined(separator: ", ")
                    self.txtAlamat.text = address
                    print("=================================")
                    print(address)
                }
         
            }
            else {
                print("Problem with the data received from geocoder")
            }
        })
     
    }
    
    func goSyarat() {
        
        print("go Syarat")
        let vc = SyaratController()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func prepare(for segue: (UIStoryboardSegue!), sender: Any!) {
        
        //let backItem = UIBarButtonItem()
        //backItem.title = ""
        //navigationItem.backBarButtonItem = backItem
        
        //if (segue.identifier == "home_page") {
        //let navController = segue.destination as! UINavigationController
        //let detailController = navController.topViewController as! VCWarungDetail
        //detailController.slug = "haha"
        //}
    }
    

}





//    func getAddressForLatLng(latitude: String, longitude: String) {
//        let url = NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?latlng=\(latitude),\(longitude)&key=AIzaSyBOfEwCHrAsU2h")
//        let data = NSData(contentsOfURL: url as! URL )
//        let json = try! JSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
//        if let result = json["results"] as? NSArray {
//            if let address = result[0]["address_components"] as? NSArray {
//                let number = address[0]["short_name"] as! String
//                let street = address[1]["short_name"] as! String
//                let city = address[2]["short_name"] as! String
//                let state = address[4]["short_name"] as! String
//                let zip = address[6]["short_name"] as! String
//                print("\n\(number) \(street), \(city), \(state) \(zip) \(address)")
//            }
//        }

//self.getAddressForLatLng(String(format: "%@",marker.position.latitude), longitude:String(format: "%@",marker.position.longitude)

//    }

