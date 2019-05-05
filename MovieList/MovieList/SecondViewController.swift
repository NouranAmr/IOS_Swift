//
//  SecondViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-3 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var titleLbl: UILabel!
    @IBOutlet var ratingLbl: UILabel!
    @IBOutlet var imageLbl: UILabel!
    @IBOutlet var genreLbl: UILabel!
    @IBOutlet var releaseYearLbl: UILabel!
    var movieObj1 = Movie()
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text=movieObj1.title
        ratingLbl.text=String(movieObj1.rating)
        releaseYearLbl.text=String(movieObj1.releaseYear)
        imageLbl.text=movieObj1.image

        // Do any additional setup after loading the view.
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
