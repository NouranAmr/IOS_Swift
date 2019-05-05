//
//  ViewController.swift
//  DelegateDemo
//
//  Created by JETS Mobile Lab-3 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController , clearprotocal {
   
   
    @IBOutlet var myTextView: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! SecondViewController
         secondVC.firstVC=self
        secondVC.str = myTextView.text!
       
        
    }
    func clear() {
        myTextView.text=""
    }


}

