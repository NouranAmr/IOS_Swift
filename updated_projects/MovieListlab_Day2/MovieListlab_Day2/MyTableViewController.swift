//
//  MyTableViewController.swift
//  MovieListlab_Day2
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController , AddMovieProtocol{


    var movieArray = Array <NSManagedObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieClass")
        do{
            movieArray = try managerContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print(error)
            
        }
        
    }
    func addNewMovie(newMovie: Movie) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "MovieClass", in: managerContext)
        let movie = NSManagedObject(entity: entity!, insertInto: managerContext)
        
        movie.setValue(newMovie.rating, forKey: "rate")
        movie.setValue(newMovie.releaseYear, forKey: "releasedyear")
        movie.setValue(newMovie.image, forKey: "image")
        movie.setValue(newMovie.title, forKey: "title")
        movie.setValue(newMovie.genre?.description, forKey: "genre")
        
        
        do{
            try managerContext.save()
            movieArray.append(movie)
        }
        catch let error as NSError
        {
            print(error.localizedDescription)
        }
        self.tableView.reloadData()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=movieArray[indexPath.row].value(forKey: "title") as! String

        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let viewType =  segue.destination.restorationIdentifier
        if viewType == "showMovie"
        {
        let movieVC = segue.destination as! ViewController
        movieVC.movieObj1 = movieArray[(self.tableView.indexPathForSelectedRow?.row)!]
        }
        else if viewType == "addMovie"
        {
            let addMovieVC = segue.destination as!AddMovieViewController
            addMovieVC.firstVC = self
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    
}
