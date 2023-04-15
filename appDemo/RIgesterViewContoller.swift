//
//  RIgesterViewContoller.swift
//  appDemo
//
//  Created by youssef osama on 23/01/1402 AP.
//

import Foundation

import UIKit

class RigesterViewContorller: UIViewController {
    
    struct RegisterType{
        var typeImage : UIImageView!
        
        var typeLabel : UILabel!
        var typeButton : UIView!
        var typeView : UIView!
        
        
    }
    
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var typeButtonsHView: UIStackView!
    @IBOutlet weak var Button3: UIView!
    @IBOutlet weak var Button2: UIView!
    @IBOutlet weak var Button1: UIView!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var indevidualUserView: UIView!
    @IBOutlet weak var selectCityField: UITextField!
    @IBOutlet weak var deleteButton: UIImageView!
    @IBOutlet weak var croporateView: UIView!
    @IBOutlet weak var croporateName: UITextField!
    @IBOutlet weak var citySelector: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var contactPerson: UITextField!
    @IBOutlet weak var uploadLicense: UITextField!
    @IBOutlet weak var vatNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confPassowrd: UITextField!
    @IBOutlet weak var healthView: UIView!
    @IBOutlet weak var indevidualUserImage: UIImageView!
    @IBOutlet weak var indevidualUserLabel: UILabel!
    @IBOutlet weak var coroprateUserLabel: UILabel!
    @IBOutlet weak var croporateImage: UIImageView!
    @IBOutlet weak var healthCenterLabel: UILabel!
    @IBOutlet weak var healthCenterImage: UIImageView!
    
    var selectedView : UIView? =  nil
    var seletcedButton : UIView? = nil
    
    var indevidualUserObject : RegisterType? = nil
    var croporateUserObject : RegisterType? = nil
    var healthCenterObject : RegisterType? = nil
    
    var selectedType : RegisterType? = nil
    var oldSelectedImage : UIImage? =  nil
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indevidualUserObject =  RegisterType(typeImage: indevidualUserImage,typeLabel: indevidualUserLabel,typeButton: Button1,typeView: indevidualUserView)
        
        croporateUserObject =  RegisterType(typeImage: croporateImage,typeLabel: coroprateUserLabel,typeButton: Button2,typeView: croporateView)
        
        
        healthCenterObject =  RegisterType(typeImage: healthCenterImage,typeLabel: healthCenterLabel,typeButton: Button3,typeView: healthView)
        
        
        [indevidualUserObject, croporateUserObject, healthCenterObject].forEach{
            obj in
            
            obj?.typeImage.image = obj?.typeImage.image?.maskWithColor(color: UIColor.lightGray)
        }
        
        [Button1, Button2, Button3].forEach { button in
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
            button.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            button.layer.shadowOpacity = 1.0
            button.layer.shadowRadius = 3.0
            button.layer.cornerRadius = 8
        }
        /*
        let padding = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 5)
        firstNameField.bounds.inset(by: padding)
         */
        deleteButton.layer.cornerRadius = 5
        
        [firstNameField,lastNameField,emailField,passwordField,confirmField,selectCityField , croporateName , citySelector , phoneNumber , contactPerson,uploadLicense /*, vatNumber , password, confPassowrd*/].forEach {
            textField in
            let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
            
            textField.leftView = paddingView
            textField.leftViewMode = .always
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
        }
       
       
        
        croporateView.isHidden = true
        indevidualUserView.isHidden = true
        healthView.isHidden =  true
    }
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    
    @IBAction func onTypeButtonClicked(_ sender: UIButton) {
        topConstraint.constant = 10
        contentScrollView.isHidden =  false
       
        UIStackView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            self.unselectRegisterType()
                
            }
        
        if let selectedView =  selectedView{
            selectedView.isHidden = true
        }
     
        switch sender.tag{
        case 1 :
            setSelectedType(registerType:indevidualUserObject)
            selectedType = indevidualUserObject
           
            break
        case 2:
            setSelectedType(registerType:croporateUserObject)
            selectedType = croporateUserObject
            break
        case 3:
            setSelectedType(registerType: healthCenterObject)
            selectedType = healthCenterObject
            break
            
        default :
            break
            
        }
    }
    
    
    func setSelectedType(registerType : RegisterType?){
        registerType?.typeButton.backgroundColor = UIColorFromHex(rgbValue: 0x01A0A3,alpha: 1)
       
        registerType?.typeLabel.textColor = UIColor.white
        oldSelectedImage =  registerType?.typeImage.image
        registerType?.typeImage.image =   oldSelectedImage?.maskWithColor(color: UIColor.white)
        registerType?.typeView.isHidden =  false
           
    }
    
    func unselectRegisterType(){
        selectedType?.typeImage.image = oldSelectedImage
        selectedType?.typeButton.backgroundColor = UIColor.white
        selectedType?.typeLabel.textColor = UIColor.lightGray
        selectedType?.typeView.isHidden =  true
    }
    
    
    
    
}

extension UIImage {

    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!

        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)

        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }

}
