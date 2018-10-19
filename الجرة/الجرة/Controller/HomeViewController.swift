//
//  HomeViewController.swift
//  الجرة
//
//  Created by Sayed Abdo on 10/13/18.
//  Copyright © 2018 JETS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendBu(_ sender: Any) {
        let person = Person()

        if Connectivity.isConnectedToInternet {
            print("Yes! internet is available.")

            
            if nameTF.text?.isEmpty ?? true {
                self.showAlert(mess: "من فضلك قم بادخال الاسم ", tit: "الاسف البيانات ناقصه")
                return
            } else {
                person.pName = nameTF.text!
            }
            if phoneTF.text?.isEmpty ?? true {
                self.showAlert(mess: "من فضلك قم بادخال رقم الجوال ", tit: "الاسف البيانات ناقصه")
                return
            } else {
                person.pPhoneNumber = phoneTF.text!
            }
            if emailTF.text?.isEmpty ?? true {
                self.showAlert(mess: "من فضلك فم بادخال البريد الاليكتروني ", tit: "الاسف البيانات ناقصه")
                return
            }
            
            
            else {
                if (self.isValidEmail(testStr: emailTF.text!)){
                person.pEmail = emailTF.text!
                }
                else{
                    
                    self.showAlert(mess:"من فضلك تاكد من ادخال بريد الكتروني صحيح  ", tit: "الاسف ")
                }
            }
            WebService.getResponse(p:person) { (error :Error?, statuse : Int) in
                
                if(error  == nil){
                    if(statuse == 0){
                        
                        self.showAlert(mess:"عفوا لقد قمت بالتسجيل من قبل ", tit: "الاسف")
                        
                    }
                    else{
                        
                        
                        
                        
            let objectFromDetails = self.storyboard?.instantiateViewController(withIdentifier:"detailsVC") as! DetailsViewController
                person.pRequestNumber = String(statuse)
                objectFromDetails.personObj = person
                  
self.navigationController?.pushViewController(objectFromDetails, animated: true)
                    }
                }
                else{
                    self.showAlert(mess: "Server Error", tit: " Sorry ");
                }
                
                
                
                
                
                
                
                
                
            }
            
            
            
            
        }
        else{
            
            
            showAlert(mess: " من فضلك تحقق من الاتصال بالانترنت  ", tit: " الاسف ")
        }
       
    
        
        
    }
     func showAlert( mess : String , tit : String){
        let alert = UIAlertController(title: tit, message: mess, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler:{ action in
        }))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
       
        return emailTest.evaluate(with: testStr)
    }

}
