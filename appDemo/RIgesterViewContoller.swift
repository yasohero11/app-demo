//
//  RIgesterViewContoller.swift
//  appDemo
//
//  Created by youssef osama on 23/01/1402 AP.
//

import Foundation

import UIKit

class RigesterViewContorller: UIViewController {
    
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
    
    var selectedView : UIView? =  nil
    var seletcedButton : UIView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        UIColorFromHex(rgbValue: 0x323232,alpha: 1)
        UIStackView.animate(withDuration: 0.5) {
                self.view.layoutIfNeeded()
            self.seletcedButton?.backgroundColor = UIColor.white
                
            }
        
        if let selectedView =  selectedView{
            selectedView.isHidden = true
        }
     
        switch sender.tag{
        case 1 :
            Button1.backgroundColor = UIColorFromHex(rgbValue: 0x01A0A3,alpha: 1)
            seletcedButton = Button1
            indevidualUserView.isHidden = false
            selectedView = indevidualUserView
            break
        case 2:
            Button2.backgroundColor = UIColorFromHex(rgbValue: 0x01A0A3,alpha: 1)
            seletcedButton = Button2
            croporateView.isHidden = false
            selectedView = croporateView
            break
        case 3:
            Button3.backgroundColor = UIColorFromHex(rgbValue: 0x01A0A3,alpha: 1)
            seletcedButton = Button3
            healthView.isHidden = false
            selectedView = healthView
            break
            
        default :
            break
            
        }
    }
    
    
    
    
    
}
