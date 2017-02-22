//
//  AgendaTableViewController.swift
//  InviteTeam
//
//  Created by Buka Cakrawala on 2/22/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit

struct Objects {
    var sectionName: String!
    var sectionObjects: [String]!
}

class AgendaTableViewController: UITableViewController {
    
    var objectsArray = [Objects]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectsArray = [Objects(sectionName: "section 1", sectionObjects: ["one", "two", "three", "four"]),
                        Objects(sectionName: "section 2", sectionObjects: ["five", "six", "seven", "eight"]),
                        Objects(sectionName: "section 3", sectionObjects: ["nine", "ten", "eleven", "twelve"]),
                        Objects(sectionName: "section 4", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"]),
                        Objects(sectionName: "section 5", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"]),
                        Objects(sectionName: "section 6", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"]),
                        Objects(sectionName: "section 7", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"])]
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "agendaCell") as UITableViewCell!
        
        cell?.textLabel?.text = objectsArray[indexPath.section].sectionObjects[indexPath.row]
        
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }
    
    
}
