//
//  AppDelegate.swift
//  epochBar
//
//  Created by Ethan Dickson on 3/9/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem.button?.title = "epch" // Set the menu bar title
        statusItem.button?.target = self // Make sure the button press is sent to us
        statusItem.button?.action = #selector(showEpochBar) // on press, run a function that creates a popover
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @objc func showEpochBar() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") // set the vc to the storyboard vc
            as? ViewController else {
                fatalError("This should never happen")
            }
        
            let popoverView = NSPopover()
            popoverView.contentViewController = vc
            popoverView.behavior = .transient
        popoverView.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY) // display the popover
    }

}

