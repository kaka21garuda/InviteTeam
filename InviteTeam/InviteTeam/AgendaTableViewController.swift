//
//  AgendaTableViewController.swift
//  InviteTeam
//
//  Created by Buka Cakrawala on 2/22/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import EventKit

struct Objects {
    var sectionName: String!
    var sectionObjects: [String]!
}

class AgendaTableViewController: UITableViewController {
    
    let eventStore = EKEventStore()
    
    
    var objectsArray = [Objects]()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var events = EKEvent(eventStore: eventStore)
        var calendarsArray = [EKCalendar]()
        calendarsArray = eventStore.calendars(for: .event)
        
        for calendar: EKCalendar in calendarsArray {
            print(calendar)
        }
        
        objectsArray = [Objects(sectionName: "section 1", sectionObjects: ["one", "two", "three", "four"]),
                        Objects(sectionName: "section 2", sectionObjects: ["five", "six", "seven", "eight"]),
                        Objects(sectionName: "section 3", sectionObjects: ["nine", "ten", "eleven", "twelve"]),
                        Objects(sectionName: "section 4", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"]),
                        Objects(sectionName: "section 5", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"]),
                        Objects(sectionName: "section 6", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"]),
                        Objects(sectionName: "section 7", sectionObjects: ["thirteen", "fourteen", "fifteen", "sixteen"])]
        
        
        
    }
    
    //MAKR: - Table View
    // Returning tableView cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        
        cell.titleLabel.text =  objectsArray[indexPath.section].sectionObjects[indexPath.row]
        cell.startLabel.text = "12:00"
        cell.endLabel.text = "01:00"
        
        
        return cell
    }
    
    // row in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    // number of rows
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    // set title for header
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }
    
    
}
