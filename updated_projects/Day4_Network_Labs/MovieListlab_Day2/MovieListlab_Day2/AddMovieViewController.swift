//
//  AddMovieViewController.swift
//  MovieListlab_Day2
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {
    @IBOutlet weak var titleTxt: UITextField!
  
    @IBOutlet weak var imageTxt: UITextField!
    @IBOutlet weak var rateTxt: UITextField!
    @IBOutlet weak var genreTxt: UITextField!
    @IBOutlet weak var yearTxt: UITextField!
    var movie = Movie ()
    var firstVC : AddMovieProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        
        
        movie.title = titleTxt.text!
        movie.genre = (genreTxt.text?.components(separatedBy: " , "))!
        movie.image = imageTxt.text!
        movie.rating = Float( rateTxt.text!)!
        movie.releaseYear = Int( yearTxt.text!)!
        firstVC?.addNewMovie(newMovie: movie)
        self.navigationController?.popViewController(animated:true)
       
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
