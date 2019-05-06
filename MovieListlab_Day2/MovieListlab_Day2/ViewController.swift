//
//  ViewController.swift
//  MovieListlab_Day2
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var releaseYearLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    var movieObj1 = Movie()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text=movieObj1.title
        ratingLbl.text=String(movieObj1.rating)
        releaseYearLbl.text=String(movieObj1.releaseYear)
        genreLbl.text=""
        for g in 0..<(movieObj1.genre?.count)!{
            genreLbl.text?.append((movieObj1.genre?[g])!);
            genreLbl.text?.append(" , ");
        }
        myImageView.image=UIImage(named: (movieObj1.image)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

