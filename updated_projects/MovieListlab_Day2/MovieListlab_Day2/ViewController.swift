//
//  ViewController.swift
//  MovieListlab_Day2
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var releaseYearLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var movieObj1 = NSManagedObject()

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieClass")
        
        
        
        titleLbl.text=movieObj1.value(forKey: "title") as! String
        ratingLbl.text=movieObj1.value(forKey: "rate") as! String
        releaseYearLbl.text=movieObj1.value(forKey: "releasedyear") as! String
        genreLbl.text=movieObj1.value(forKey: "genre") as! String
        
        var imageStr = movieObj1.value(forKey: "image") as! String
        myImageView.image=UIImage(named: imageStr)
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

