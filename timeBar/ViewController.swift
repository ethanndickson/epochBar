//
//  ViewController.swift
//  epochBar
//
//  Created by Ethan Dickson on 3/9/21.
//

import Cocoa

class ViewController: NSViewController{

    @IBOutlet var humanTime: NSDatePicker!
    @IBOutlet var unixTime: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        humanTime.dateValue = Date() // just in case Swift didn't update the datepicker for us..
        convertTimestamp(humanTime.dateValue)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func copyToClipboard(_ sender: Any) {
        let currentDate = Date()
        humanTime.dateValue = currentDate // we do this so the datepicker updates visually
        convertTimestamp(humanTime.dateValue)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(unixTime.stringValue, forType: .string)
    }
    
    @IBAction func copyAnyToClipboard(_ sender: Any) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(unixTime.stringValue, forType: .string)
    }
    @IBAction func onDatePickerChange(_ sender: NSDatePicker) {
        convertTimestamp(humanTime.dateValue)
    }
    
    @IBAction func onUnixTimeChange(_ sender: Any) {
        convertUnixTime(unixTime.stringValue)
    }
    func convertTimestamp(_ input: Date) {
        unixTime.stringValue = String(format: "%.0f", (input.timeIntervalSince1970))
    }
    
    func convertUnixTime(_ input: String) {
        guard TimeInterval(input) != nil else { return } // dont do anything if invalid int
        let tempUnix = TimeInterval(input)
        let tempDate = NSDate(timeIntervalSince1970: tempUnix!) // we can get rid of the optional since we have a guard(?)
        guard let actualDate = tempDate as Date? else { return } // check that we can convert NSDate -> Date, else dont do anything
        humanTime.dateValue = actualDate // update visually
    }
}

