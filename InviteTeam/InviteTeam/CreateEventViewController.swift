//
//  CreateEventViewController.swift
//  InviteTeam
//
//  Created by Buka Cakrawala on 2/22/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import EventKit

class CreateEventViewController: UIViewController {
    
    // make an instance of EKEventStore
    let eventStore = EKEventStore()

    //MARK: - IBOutlets
    @IBOutlet weak var addEventButton: UIButton!
    @IBAction func addAction(_ sender: UIButton) {
        
        createEvent(title: titleTextField.text!, startDate: fromDatePicker.date, endDate: endDatePicker.date)
        
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAuthorization()
        
        self.titleTextField.delegate = self
        
    }
    
    //MARK: - Event Auth & Create
    // EventKit Authorization
    func getAuthorization() {
        if EKEventStore.authorizationStatus(for: .event) != EKAuthorizationStatus.authorized {
            eventStore.requestAccess(to: .event, completion: { (success, error) in
                //
            })
        } else {
            //Authorization is authorized
            
        }
    }
    
    // Create Event with EKEvent
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

//MARK: - TextField Delegate
extension CreateEventViewController: UITextFieldDelegate {
    // When return key is dismissed, keyboard is dismissed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
