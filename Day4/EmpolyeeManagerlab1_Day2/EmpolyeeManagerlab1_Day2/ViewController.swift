//
//  ViewController.swift
//  EmpolyeeManagerlab1_Day2
//
//  Created by JETS Mobile Lab-3 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextfield: UITextField!
    @IBOutlet var myLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func managerBtn(_ sender: UIButton) {
        let managerObj = Manager()
        managerObj.salary = Double(myTextfield.text!)
        let salary = managerObj.calcSalary()
        print(salary)
        let b:String = String(format:"%.2f", salary)
        myLabel.text=b
        
        
    }
    @IBAction func studentBtn(_ sender: UIButton) {
        let empObj = Employee()
        empObj.salary = Double(myTextfield.text!)
        let salary = empObj.calcSalary()
        print(salary)
        let b:String = String(format:"%.2f", salary)
        myLabel.text=b
        
    }
}

