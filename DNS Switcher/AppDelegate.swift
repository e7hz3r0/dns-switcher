//
//  AppDelegate.swift
//  DNS Switcher
//
//  Created by Ethan Urie on 4/23/16.
//  Copyright © 2016 Strange Quark Software. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSSquareStatusItemLength)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
        
            let menu = NSMenu()
            let menuItem1 = NSMenuItem(title: "Set DNS: 8.8.8.8", action: #selector(setDNS(_:)), keyEquivalent: "1")
            let menuItem2 = NSMenuItem(title: "Set DNS: 8.8.4.4", action: #selector(setDNS(_:)), keyEquivalent: "2")
            
            menuItem1.representedObject = "8.8.8.8"
            menuItem2.representedObject = "8.8.4.4"
            
            menu.addItem(menuItem1)
            menu.addItem(menuItem2)
            menu.addItem(NSMenuItem.separatorItem())
            menu.addItem(NSMenuItem(title: "Quit", action: #selector(terminate), keyEquivalent: "q"))
            
            statusItem.menu = menu
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func terminate(sender:AnyObject?) {
        NSApplication.sharedApplication().terminate(sender)
    }

    func setDNS(sender: AnyObject?) {
        if let s = sender, let menu = s as? NSMenuItem {
            print("\(menu.representedObject)")
        }
    }

}

