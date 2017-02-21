//
//  ViewController.swift
//  InviteTeam
//
//  Created by Buka Cakrawala on 2/20/17.
//  Copyright © 2017 Buka Cakrawala. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {

    // MARK: -IBOutlets
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView")
        
    }

}

// MARK: -Extension
extension ViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    // MARK: -Configuring Calendar
    // returning a value of type ConfigurationParameters
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        // the date calendar will start from
        let startDate = formatter.date(from: "2017 02 20")
        // date calendar will end
        let endDate = Date()
        let parameters = ConfigurationParameters(startDate: startDate!,
                                                 endDate: endDate,
                                                 // the number of months you 
                                                 // want to display
                                                 numberOfRows: 6,
                                                 calendar: Calendar.current,
                                                 generateInDates: .forAllMonths,
                                                 generateOutDates: .tillEndOfGrid,
                                                 firstDayOfWeek: .sunday,
                                                 hasStrictBoundaries: true)
        return parameters
    }
    
    // MARK: -Calendar Cell
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        
        let myCustoCell = cell as! CellView
        
        //seting up text inside cell
        myCustoCell.dayLabel.text = cellState.text
        
        //setup text color
        if cellState.dateBelongsTo == .thisMonth {
            myCustoCell.dayLabel.textColor = UIColor.black
        } else {
            myCustoCell.dayLabel.textColor = UIColor.gray
        }
        
    }
    
}



















