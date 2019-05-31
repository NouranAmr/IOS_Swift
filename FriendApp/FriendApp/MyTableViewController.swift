//
//  MyTableViewController.swift
//  FriendApp
//
//  Created by Esraa Hassan on 5/31/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit
import SQLite3
class MyTableViewController: UITableViewController {

    @IBOutlet var myTableView: UITableView!
    let createTableString = """
    CREATE TABLE User(
    ID INT PRIMARY KEY NOT NULL,
    Name CHAR(255),Age INT);
    """
    let queryStatement = "SELECT * FROM User;"
    var db: OpaquePointer?
    let myPath="/Users/esraahassan/Documents/Shared/SQLiteTutorial/Part1.sqlite"
   
    var friendNameArray =  [String]()
    var resultArray = [String] ()
    var friendIDArray = [Int]()
    var friendAgeArray = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource=self
        myTableView.delegate=self
       
        db = openDatabase()
       // createTable()
//        insert(id: 1, name: "Nouran", age: 22)
//        insert(id: 2, name: "Esraa", age: 23)
//        insert(id: 3, name: "Salma", age: 24)
//        insert(id: 4, name: "radya", age: 22)
//        insert(id: 5, name: "amr", age: 23)
//        insert(id: 6, name: "Sahar", age: 22)
        query()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func destroyDatabase(){
        do {
            try FileManager.default.removeItem(at: URL(fileURLWithPath: myPath))
        } catch let error as NSError {
            print("Error: \(error.domain)")
        }
    }
    func openDatabase() -> OpaquePointer? {
    
        if sqlite3_open(myPath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(myPath)")
            return db
        } else {
            print("Unable to open database. Verify that you created the directory described " +
                "in the Getting Started section.")
            self.dismiss(animated: true, completion: nil)
        }
        return db
    }
    func createTable() {
        // 1
        var createTableStatement: OpaquePointer? = nil
        // 2
        //    int sqlite3_prepare_v2(
        //        sqlite3 *db,            /* Database handle */
        //        const char *zSql,       /* SQL statement, UTF-8 encoded */
        //        int nByte,              /* Maximum length of zSql in bytes. */
        //        sqlite3_stmt **ppStmt,  /* OUT: Statement handle */
        //        const char **pzTail     /* OUT: Pointer to unused portion of zSql */
        //    );
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK { //
            // 3
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Friend table created.")
            } else {
                print("Friend table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        // 4
        sqlite3_finalize(createTableStatement)
        //You must always call sqlite3_finalize() on your compiled statement to delete it and avoid resource leaks. Once a statement has been finalized, you should never use it again.
    }
    
    func insert(id :Int ,name : String ,age : Int) {
        var insertStatement: OpaquePointer? = nil
        let insertStatementString = "INSERT INTO User (ID,Name,Age) VALUES (?,?,?);"
        // 1
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let friendName: NSString = name as NSString
            // 2
            sqlite3_bind_int(insertStatement, 1,Int32(id))
            // 3
           sqlite3_bind_text(insertStatement, 2, friendName.utf8String, -1, nil) // int sqlite3_bind_text(sqlite3_stmt*,int,const char*,int,void(*)(void*));
            // the fifth arg is destructor used to dispose of the BLOB or string after SQLite has finished with it.
             sqlite3_bind_int(insertStatement, 3,Int32(age))
            
            // 4
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print (sqlite3_step(insertStatement).words )
                print("Could not insert row.")
            }
            }
         else {
            print("INSERT statement could not be prepared.")
        }
        // 5
        sqlite3_finalize(insertStatement)
    }
    
    func query() {
        var queryStatement2: OpaquePointer? = nil
        // 1
        if sqlite3_prepare_v2(db, queryStatement, -1, &queryStatement2, nil) == SQLITE_OK {
            // 2
            while sqlite3_step(queryStatement2) == SQLITE_ROW {
                // 3
               let id = sqlite3_column_int(queryStatement2, 0)
                friendIDArray.append(Int(id))
                // 4
                let queryResultCol1 = sqlite3_column_text(queryStatement2, 1)
                let name = String(cString: queryResultCol1!)
                friendNameArray.append(name)
                
                // 5
                let age = sqlite3_column_int(queryStatement2, 2)
                friendAgeArray.append(Int(age))
                //print("Query Result:")
          
                
            }
            sqlite3_finalize(queryStatement2)
        }}
    
    func delete(id : Int) {
        var deleteStatement: OpaquePointer? = nil
        let deleteStatementStirng = "DELETE FROM Friend WHERE ID = \( String(id));"
        print("DELETE FROM User WHERE Phone = \(String(id));")
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared") // Handling Errors // Try to change the table name :)
            let errorMessage = String.init(cString: sqlite3_errmsg(db))
            print(errorMessage)
        }

        sqlite3_finalize(deleteStatement)
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
        return friendNameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.friendName.text = friendNameArray[indexPath.row]
        cell.friendID.text = String(friendIDArray[indexPath.row])
        cell.friendAge.text = String(friendAgeArray[indexPath.row])
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            delete(id: friendIDArray[indexPath.row])
            self.friendNameArray.remove(at: indexPath.row)
            self.friendAgeArray.remove(at: indexPath.row)
            self.friendIDArray.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.myTableView.reloadData()
        }
    }
    

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
