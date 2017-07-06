//
//  ViewController.swift
//  ContextMenuiOS10
//
//  Created by Alex Cuello ortiz on 06/07/2017.
//  Copyright © 2017 Eironeia. All rights reserved.
//

import UIKit



class Hipster:UILabel {
    
    
    
}

class CustomCell:UITableViewCell {
    @IBOutlet var customLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var cellText:String! // This should be do it worth

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
//    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool { //This is used to hide some of the selectors, return false in those you want be hidden.
//        
//        if action == #selector(customAction1) {
//          return true
//        }
//        return false
//    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(self.canBecomeFirstResponder) // This should be true otherwise pop up it won't show (it's true due to we have override canBecomeFirstResponder returning true).
        
        let cell = tableView.cellForRow(at: indexPath)
        let targetRectangle = cell!.frame
        UIMenuController.shared.setTargetRect(targetRectangle, in: self.view)
        
        let menuItem = UIMenuItem(title: "Custom action", action: #selector(customAction1))
        let menuItem2 = UIMenuItem(title: "Custom action2", action: #selector(customAction2))
        let menuItem3 = UIMenuItem(title: "Copy", action: #selector(customAction2))
        
        UIMenuController.shared.menuItems = [menuItem,menuItem2, menuItem3]
        UIMenuController.shared.setMenuVisible(true, animated: true)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func customAction1() {
        print("Custom action1")
    }
    
    func customAction2() {
        print("Custom action2")
        print(self.canBecomeFirstResponder)
    }
    
    func copyText() {
        print("Copy")
    }
}

