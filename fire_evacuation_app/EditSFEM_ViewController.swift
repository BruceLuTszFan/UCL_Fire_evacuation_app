//
//  ShowFEM_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 10/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class EditSFEM_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // UI CONNECTION SETUP - textfield
    /// textfield of sfem's name
    @IBOutlet weak var SFEM_Name: UITextField!
    /// textfield of sfem's department
    @IBOutlet weak var SFEM_Department: UITextField!
    /// textfield of sfem's date of training
    @IBOutlet weak var SFEM_DateOfTraining: UITextField!
    /// textfield of sfem's email
    @IBOutlet weak var SFEM_Email: UITextField!
    
    
    
    // UI CONNECTION SETUP - tableView
    /// tableView for building
    @IBOutlet weak var buildingTableView: UITableView!
    /// tableView for floor
    @IBOutlet weak var floorTableView: UITableView!
    
    
    
    // Variables setup
    /// int value to store original index of building that fem belonged to
    private(set) var originalBuilding: Int = 0
    /// int value to store original index of floor that fem belonged to
    private(set) var originalFloor: Int = 0
    
    
    
    // UI CONNECTION SETUP - buttons
    /// when the done button is pressed, run validation for input, if correct remove the sfem from its area and create a new object of it and add it to the target floor specified by user, if incorrect activate empty field alert
    @IBAction func doneButtonPressed(_ sender: Any) {
        if textfieldValidation([SFEM_Name, SFEM_Department, SFEM_DateOfTraining, SFEM_Email]){
            // remove original SFEM
            let SFEMtoRemove = Buildings.share.buildings[originalBuilding].floors[originalFloor].sfems[Buildings.share.currentSFEM]
            Buildings.share.buildings[originalBuilding].floors[originalFloor].removeSFEM(SFEMtoRemove)
            // add new SFEM
            let new_SFEM = SFEM(SFEM_Name.text!.capitalized, SFEM_Department.text!.capitalized, SFEM_DateOfTraining.text!, SFEM_Email.text!)
            Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].addSFEM(new_SFEM)
            dismiss(animated: true, completion: nil)
        }
        else{
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
        reloadTableViews([buildingTableView, floorTableView])
    }
    
    /// record the index of original location of sfem
    func recordOriginalLocation(){
        originalBuilding = Buildings.share.currentBuilding
        originalFloor = Buildings.share.currentFloor
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
        SFEM_Name.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].sfems[Buildings.share.currentSFEM].name
        SFEM_Department.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].sfems[Buildings.share.currentSFEM].department
        SFEM_DateOfTraining.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].sfems[Buildings.share.currentSFEM].dateOfTraining
        SFEM_Email.text = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].sfems[Buildings.share.currentSFEM].email
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
        default:
            return Buildings.share.buildings[Buildings.share.currentBuilding].floors.count
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
        default:
            title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[indexPath.row].name
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
        default:
            return "Floor"
        }
    }
    
    // decide the action after user pressed the corresponding cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: unselect all cell that is not selected //
        switch tableView {
        case buildingTableView:
            Buildings.share.currentBuilding = indexPath.row
            Buildings.share.currentFloor = 0
            Buildings.share.currentArea = 0
            reloadTableViews([buildingTableView, floorTableView])
        default:
            Buildings.share.currentFloor = indexPath.row
            Buildings.share.currentArea = 0
            reloadTableViews([floorTableView])
        }
        _ = tableView.cellForRow(at: indexPath)!.accessoryType = UITableViewCellAccessoryType.checkmark
    }
}
