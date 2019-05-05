//
//  MyTableViewController.swift
//  MovieList
//
//  Created by JETS Mobile Lab-3 on 5/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var movieArray : [Movie]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var obj1=Movie()
        obj1.title="Dawn of the Planet of the Apes"
        obj1.image="https://api.androidhive.info/json/movies/1.jpg"
        obj1.rating=8.3
        obj1.releaseYear=2014
        obj1.genre=["Action", "Drama", "Sci-Fi"]
       
        var obj2=Movie()
        obj2.title="District 9"
        obj2.image="https://api.androidhive.info/json/movies/2.jpg"
        obj2.rating=8
        obj2.releaseYear=2009
        obj2.genre=["Action", "Sci-Fi", "Thriller"]
        
        var obj3=Movie()
        obj3.title="Transformers: Age of Extinction"
        obj3.image="https://api.androidhive.info/json/movies/3.jpg"
        obj3.rating=6.3
        obj3.releaseYear=2014
        obj3.genre=["Action", "Adventure", "Sci-Fi"]
        
        var obj4=Movie()
        obj4.title="X-Men: Days of Future Past"
        obj4.image="https://api.androidhive.info/json/movies/4.jpg"
        obj4.rating=8.4
        obj4.releaseYear=2014
        obj4.genre=["Action", "Sci-Fi", "Thriller"]
        
        var obj5=Movie()
        obj5.title="The Machinist"
        obj5.image="https://api.androidhive.info/json/movies/5.jpg"
        obj5.rating=7.8
        obj5.releaseYear=2004
        obj5.genre=["Drama", "Thriller"]
        
        movieArray.append(obj1)
        movieArray.append(obj2)
        movieArray.append(obj3)
        movieArray.append(obj4)
        movieArray.append(obj5)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text=movieArray[ indexPath.row].title
        


        return cell
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
