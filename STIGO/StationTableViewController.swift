//
//  StationTableViewController.swift
//  STIGO
//
//  Created by Erik Hemingway on 8/19/17.
//  Copyright © 2017 Erik Hemingway. All rights reserved.
//

import UIKit

class StationTableViewController: UITableViewController {
    
    var titleList = ["Gold Line", "Blue Line", "Red Line", "Green Line"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Stations", for: indexPath) as! DetailTableCell
        
        cell.cellTitle.text = titleList[indexPath.row]
        
        return cell
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "showDetail") {
            
            let DVC = segue.destination as! DetailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let title = titleList[indexPath.row] as String
                DVC.sentData1 = title
                
                
                
            }
            
        }
        
    }

}
