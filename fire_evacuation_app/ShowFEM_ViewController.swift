//
//  ShowFEM_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 10/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class ShowFEM_ViewController: UIViewController {
    
    /// UI CONNECTION SETUP - labels
    /// Label to display the current FEM name
    @IBOutlet weak var FEM_Name: UILabel!
    /// Label to display the current FEM department
    @IBOutlet weak var FEM_Department: UILabel!
    /// Label to display the current FEM date of training
    @IBOutlet weak var FEM_DateOfTraining: UILabel!
    /// Label to display the current FEM email
    @IBOutlet weak var FEM_Email: UILabel!
    
    
    
    /// UI CONNECTION SETUP - buttons
    /// when the done button is pressed, dismiss and return to homepage
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    /// Utility Functions
    /// run when view is loaded - initiate the labels
    override func viewDidLoad() {
        super.viewDidLoad()
        FEM_Name.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].name
        FEM_Department.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].department
        FEM_DateOfTraining.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].dateOfTraining
        FEM_Email.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].email
    }
    
}


