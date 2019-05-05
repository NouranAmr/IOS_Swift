//
//  SecondViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab-3 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var str : String = ""
    var firstVC : clearprotocal?
    
    @IBOutlet var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text=str
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clearBtn(_ sender: Any)
        {
            firstVC?.clear()
            self.navigationController?.popViewController(animated: true)
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
