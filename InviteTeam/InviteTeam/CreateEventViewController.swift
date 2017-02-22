//
//  CreateEventViewController.swift
//  InviteTeam
//
//  Created by Buka Cakrawala on 2/22/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import EventKit

class CreateEventViewController: UIViewController, UITextFieldDelegate {
    
    // make an instance of EKEventStore
    let eventStore = EKEventStore()

    //MARK: -IBOutlets
    @IBOutlet weak var addEventButton: UIButton!
    @IBAction func addAction(_ sender: UIButton) {
        
        createEvent(title: titleTextField.text!, startDate: fromDatePicker.date, endDate: endDatePicker.date)
        
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAuthorization()
        
        self.titleTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func getAuthorization() {
        if EKEventStore.authorizationStatus(for: .event) != EKAuthorizationStatus.authorized {
            eventStore.requestAccess(to: .event, completion: { (success, error) in
                //
            })
        } else {
            //Authorization is authorized
            
        }
    }
    
    func createEvent(title: String, startDate: Date, endDate: Date) {
        let event = EKEvent(eventStore: eventStore)
        
        event.title = title
        event.startDate = startDate
        event.endDate = endDate
        event.calendar = eventStore.defaultCalendarForNewEvents
        
        do {
            try eventStore.save(event, span: .thisEvent)
        } catch {
            print("Error when creating an event")
        }
        
    }
    
}
