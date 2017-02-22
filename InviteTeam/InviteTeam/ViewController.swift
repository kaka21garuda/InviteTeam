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
    
    let white = UIColor(colorWithHexValue: 0xECEAED)
    let darkPurple = UIColor(colorWithHexValue: 0x3A284C)
    let dimPurple = UIColor(colorWithHexValue: 0x574865)

    // MARK: -IBOutlets
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendarView.dataSource = self
        calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView")
        
        calendarView.cellInset = CGPoint(x: 0, y: 0)
        
    }
    
    // Function to handle the text color of the calendar
    func handleCellTextColor(view: JTAppleDayCellView?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        
        if cellState.isSelected {
            myCustomCell.dayLabel.textColor = UIColor.green
            myCustomCell.selectedView.isHidden = false
            myCustomCell.selectedView.backgroundColor = UIColor.yellow
        } else {
            if cellState.dateBelongsTo == .thisMonth {
                myCustomCell.dayLabel.textColor = white
            } else {
                myCustomCell.dayLabel.textColor = dimPurple
            }
        }
    }
    
    // Function to handle the calendar selection
    func handleCellSelection(view: JTAppleDayCellView?, cellState: CellState) {
        guard let myCustomCell = view as? CellView  else {
            return
        }
        
        
        // myCustomCell.selectedView.frame = myCustomCell.bounds.insetBy(dx: 5, dy: 5)
        print("******* Cell Selected....")
        print(myCustomCell.selectedView)
        print(myCustomCell.selectedView.layer.cornerRadius)
        
        
        
        if cellState.isSelected {
            // myCustomCell.selectedView.layer.cornerRadius =  25
            myCustomCell.selectedView.isHidden = false
        } else {
            myCustomCell.selectedView.isHidden = true
        }
        
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
        let startDate = formatter.date(from: "2017 02 20")!
        // date calendar will end
        let endDate = Date()
        let parameters = ConfigurationParameters(startDate: startDate,
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
        myCustoCell.selectedView.backgroundColor = UIColor.yellow
        
        handleCellTextColor(view: cell, cellState: cellState)
        handleCellSelection(view: cell, cellState: cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        
        let myCustomCell = cell as! CellView
        
        // Let's make the view have rounded corners. Set corner radius to 25
        myCustomCell.selectedView.layer.cornerRadius =  10
        
        if cellState.isSelected {
            myCustomCell.selectedView.isHidden = false
        }
        
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        
        let myCustomCell = cell as! CellView
        myCustomCell.selectedView.isHidden = false
        
        handleCellSelection(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
    }
    
}

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
