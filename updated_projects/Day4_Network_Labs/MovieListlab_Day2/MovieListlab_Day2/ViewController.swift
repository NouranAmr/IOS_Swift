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
    var imgString :String?

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         let appDelegate = UIApplication.shared.delegate as! AppDelegate
         let managerContext=appDelegate.persistentContainer.viewContext
         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieClass")
         
         
         
         titleLbl.text=movieObj1.value(forKey: "title") as! String
         ratingLbl.text=String (movieObj1.value(forKey: "rate") as! Float)
         releaseYearLbl.text=String(movieObj1.value(forKey: "releasedyear") as! Int)
         genreLbl.text=movieObj1.value(forKey: "genre") as! String
         
         var imageStr = movieObj1.value(forKey: "image") as! String
         myImageView.image=UIImage(named: imageStr)
        */
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieClass")
        
        titleLbl.text=movieObj1.value(forKey: "title") as! String
        ratingLbl.text=String (movieObj1.value(forKey: "rate") as! Float)
        releaseYearLbl.text=String(movieObj1.value(forKey: "releasedyear") as! Int)
        genreLbl.text=movieObj1.value(forKey: "genre") as! String
        
        imgString = movieObj1.value(forKey: "image") as! String
        let url=URL(string:imgString!)
        let request=URLRequest(url: url!)
        let session=URLSession(configuration: URLSessionConfiguration.default)
        let task = session.downloadTask(with: request) { (url, response, error) in
            do{
                var picData = try Data(contentsOf: url!)
                DispatchQueue.main.async {
                    
                    self.myImageView.image = UIImage(data: picData)
                    
                    
                }
                
                
            }catch{
                
            }
            }.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

