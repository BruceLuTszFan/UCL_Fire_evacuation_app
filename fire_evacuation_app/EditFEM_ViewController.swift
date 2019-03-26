//
//  ShowFEM_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 10/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class EditFEM_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UI CONNECTION SETUP - textfield
    /// textfield of fem's name
    @IBOutlet weak var FEM_Name: UITextField!
    /// textfield of fem's department
    @IBOutlet weak var FEM_Department: UITextField!
    /// textfield of fem's date of training
    @IBOutlet weak var FEM_DateOfTraining: UITextField!
    /// textfield of fem's email
    @IBOutlet weak var FEM_Email: UITextField!
    
    
    
    // UI CONNECTION SETUP - tableView
    /// tableView for building
    @IBOutlet weak var buildingTableView: UITableView!
    /// tableView for floor
    @IBOutlet weak var floorTableView: UITableView!
    /// tableView for area
    @IBOutlet weak var areaTableView: UITableView!
    
    
    // Variables setup
    /// int value to store original index of building that fem belonged to
    private(set) var originalBuilding: Int = 0
    /// int value to store original index of floor that fem belonged to
    private(set) var originalFloor: Int = 0
    /// int value to store original index of area that fem belonged to
    private(set) var originalArea: Int = 0
    
    
    
    // UI CONNECTION SETUP - buttons
    /// when the done button is pressed, run validation for input, if correct remove the fem from its area and create a new object of it and add it to the target area specified by user, if incorrect activate empty field alert
    @IBAction func doneButtonPressed(_ sender: Any) {
        if textfieldValidation([FEM_Name, FEM_Department, FEM_DateOfTraining, FEM_Email]){
            // remove original SFEM
            let FEMtoRemove = Buildings.share.buildings[originalBuilding].floors[originalFloor].areas[originalArea].fems[Buildings.share.currentFEM]
            Buildings.share.buildings[originalBuilding].floors[originalFloor].areas[originalArea].removeFEM(FEMtoRemove)
            // add new FEM
            let new_FEM = FEM(FEM_Name.text!.capitalized, FEM_Department.text!.capitalized, FEM_DateOfTraining.text!, FEM_Email.text!)
            Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].addFEM(new_FEM)
            dismiss(animated: true, completion: nil)
        }else{
            emptyField()
        }
    }
    
    
    
    // Allert Controller
    /// empty field function to alert the user that he/she has entered an empty field
    func emptyField(){
        /// ALLERT - empty field
        let emptyField = UIAlertController(title: "Empty Field", message: "You must enter all of the fields", preferredStyle: .alert)
        
        /// BUTTON - cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        /// add button for alert controller
        emptyField.addAction(cancel)
        
        /// present the alert
        present(emptyField, animated: true, completion: nil)
    }
    
    
    
    // Utility Function
    /// run when view appears - record original location of fem, set up textfield base on original data of fem, reload tableView
    override func viewDidAppear(_ animated: Bool) {
        recordOriginalLocation()
        textfieldSetup()
        reloadTableViews([buildingTableView, floorTableView, areaTableView])
    }
    
    /// record the index of original location of fem
    func recordOriginalLocation(){
        originalBuilding = Buildings.share.currentBuilding
        originalFloor = Buildings.share.currentFloor
        originalArea = Buildings.share.currentArea
    }
    
    /**
     validate whether the textfield has content on it, return false if any of the textfields is empty, otherwise return true
     - parameter texfields: The textfields to be checked
     */
    func textfieldValidation(_ textfields: [UITextField]) -> Bool{
        var correct = true
        textfields.forEach{ textfields in
            if textfields.text == ""{
                correct = false
            }
        }
        return correct
    }
    
    /// set up the value of textfields base on original information of the fem for editting
    func textfieldSetup() {
        FEM_Name.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].name
        FEM_Department.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].department
        FEM_DateOfTraining.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].dateOfTraining
        FEM_Email.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[Buildings.share.currentFEM].email
    }
    
    /*
     Reloads the table views in the view controller.
     - parameter tableView: The tableView to be reloaded.
     */
    private func reloadTableViews(_ tableView: [UITableView]){
        tableView.forEach{ tableView in
            tableView.reloadData()
        }
    }
    
    /// Table View Delegate
    /// decide the number of section of the tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// decide the number of cell in (each) section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case buildingTableView:
            return Buildings.share.buildings.count
        case floorTableView:
            return Buildings.share.buildings[Buildings.share.currentBuilding].floors.count
        default:
            return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas.count
        }
    }
    
    /// decide the style of each cell (set title)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// the cell to be added in
        let cell = UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
        
        /// string value to represent the string value (text) of the cell
        var title: String = ""
        
        switch tableView {
        case buildingTableView:
            title = Buildings.share.buildings[indexPath.row].name
        case floorTableView:
            title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[indexPath.row].name
        default:
            title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[indexPath.row].name
        }
        /// edit the text of the cell
        cell.textLabel?.text = title
        return cell
    }
    
    /// decide the header of each (section of) tableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
        case buildingTableView:
            return "Building"
        case floorTableView:
            return "Floor"
        default:
            return "Area"
        }
    }
    
    // decide the action after user pressed the corresponding cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case buildingTableView:
            Buildings.share.currentBuilding = indexPath.row
            Buildings.share.currentFloor = 0
            Buildings.share.currentArea = 0
            reloadTableViews([buildingTableView, floorTableView, areaTableView])
        case floorTableView:
            Buildings.share.currentFloor = indexPath.row
            Buildings.share.currentArea = 0
            reloadTableViews([floorTableView, areaTableView])
        default:
            Buildings.share.currentArea = indexPath.row
            reloadTableViews([areaTableView])
        }
        _ = tableView.cellForRow(at: indexPath)!.accessoryType = UITableViewCellAccessoryType.checkmark
    }
}


