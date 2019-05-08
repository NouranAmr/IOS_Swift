//
//  MyTableViewController.swift
//  MovieListlab_Day2
//
//  Created by Esraa Hassan on 5/6/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import CoreData
import Network

class MyTableViewController: UITableViewController , AddMovieProtocol{


     var movieArray:[NSManagedObject]!
    
    var jsonArray:[Dictionary<String,Any>]!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        jsonArray = []
        movieArray = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managerContext=appDelegate.persistentContainer.viewContext
        
        if #available(iOS 12.0, *) {
            let monitor = NWPathMonitor()
            
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    print("We're connected!")
                    let url = URL(string : "https://api.androidhive.info/json/movies.json");
                    let request = URLRequest(url: url!)
                    let session = URLSession(configuration: URLSessionConfiguration.default)
                
                    
                    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieClass")
                    do{
                        self.movieArray = try managerContext.fetch(fetchRequest)
                    }
                    catch let error as NSError{
                        print(error)
                        
                    }
                    let entity = NSEntityDescription.entity(forEntityName: "MovieClass", in:managerContext)
                    
                    
                    let task=session.dataTask(with: request) { (data, response, error) in
                        do{
                            self.jsonArray = try JSONSerialization.jsonObject(with: data!, options:.allowFragments)as!Array<Dictionary<String,Any>>
                            
                            for item in self.jsonArray!
                            {
                                
                                
                                //var movie = Movie()
                                let movie = NSManagedObject(entity: entity!, insertInto: managerContext)
                                var numberYear = item["releaseYear"] as! NSNumber
                                
                                movie.setValue((item["rating"]as! NSNumber).floatValue, forKey: "rate")
                                movie.setValue((numberYear as! Int), forKey: "releasedyear")
                                movie.setValue((item["image"] as! String), forKey: "image")
                                movie.setValue((item["title"] as! String), forKey: "title")
                                movie.setValue((item["genre"] as! [String]).description, forKey: "genre")
                                
                                self.movieArray!.append(movie)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                                
                                
                            }
                            print(self.jsonArray.count)
                            
                            
                        }
                            
                        catch
                        {
                            print("Error")
                            
                        }
                        }.resume()
                } else {
                    print("No connection.")
                    
                
                    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "MovieClass")
                    do{
                        self.movieArray = try managerContext.fetch(fetchRequest)
                    }
                    catch let error as NSError{
                        print(error)
                        
                    }
                }
               
                
                print(path.isExpensive)
            }
            let queue = DispatchQueue(label: "Monitor")
            monitor.start(queue: queue)
        } else {
           
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
        return (movieArray?.count)!
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
        movieVC.movieObj1 = movieArray![(self.tableView.indexPathForSelectedRow?.row)!]
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
