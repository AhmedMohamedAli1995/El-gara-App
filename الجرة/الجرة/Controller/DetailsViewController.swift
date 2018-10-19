//
//  DetailsViewController.swift
//  الجرة
//
//  Created by Sayed Abdo on 10/13/18.
//  Copyright © 2018 JETS. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
     var  personObj:Person = Person()
    
 
    @IBOutlet weak var emailTF: UILabel!
    @IBOutlet weak var phoneNumberTF: UILabel!
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var requestNo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNo.text = personObj.pRequestNumber
        nameTF.text = personObj.pName
        emailTF.text = personObj.pEmail
        phoneNumberTF.text = personObj.pPhoneNumber

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
