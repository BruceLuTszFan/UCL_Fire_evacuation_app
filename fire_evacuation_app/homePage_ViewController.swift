//
//  homePage_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 10/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class homePage_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// password required to access/modify FEM, SFEM and hazards.
    let password = "1325"
    let mapMenu = [[["UB_A", "UB_B"], ["LB_A", "LB_B"], ["G_A", "G_B"], ["F1_A", "F1_B"], ["F2_A", "F2_B"], ["F3_A", "F3_B"], ["F4_A", "F4_B"], ["F5_A", "F5_A"], ["F6_A", "F6_B"], ["F7_A"], ["F8_A"], ["F9_A"], ["F10_A"], ["F11_A"]], [["EFB_F1_A"], ["EFB_F2_A"], ["EFB_F3_A"], ["EFB_F4_A"]]]
    
    
    
    // UI CONNECTION SETUP - tableView
    /// tableView for SFEM
    @IBOutlet weak var sfemTableView: UITableView!
    /// tableView for FEM
    @IBOutlet weak var femTableView: UITableView!
    /// tableView for hazards
    @IBOutlet weak var hazardTableView: UITableView!
    /// tableView for room types
    @IBOutlet weak var roomTypeTableView: UITableView!
    
    
    
    // UI CONNECTION SETUP - labels
    /// label to display the current Building name
    @IBOutlet weak var BuildingTitle: UILabel!
    /// label to display the current floor and area name
    @IBOutlet weak var FloorAreaTitle: UILabel!
    /// label to display the location that is on fire
    @IBOutlet weak var locationOnFireTitle: UILabel!
    
    
    
    // UI CONNECTION SETUP - imageScrollView
    /// image to display the map of the corresponding area
    @IBOutlet weak var areaMap: UIImageView!
    
    
    
    // UI CONNECTION SETUP - buttons
    /// when the access fem button is pressed, activate password alert to take in password.
    @IBAction func AccessFEMbuttonPressed(_ sender: Any) {
        passwordAlert("SearchPageSegue")
    }
    /// when the change location button is pressed, perform segue to switchLocationPage
    @IBAction func ChangeLocationButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "SwitchLocation", sender: nil)
    }
    
    @IBAction func AccessHazardButtonPressed(_ sender: Any) {
        passwordAlert("HazardPageSegue")
    }
    
    
    // Utility Functions
    /// run when the view loads - reload tableViews, reset location index
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadAll()
        Buildings.share.resetAllIndex()
    }
    
    /// run when the view appears - reload tableViews, reset location index
    override func viewDidAppear(_ animated: Bool) {
        Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentBuilding].areas[Buildings.share.currentArea].collectOnFire()
        reloadAll()
    }
    
    /// run all reload functions
    private func reloadAll(){
        reloadTableViews()
        reloadDisplay()
    }
    
    /// reloads the table views in the view controller.
    private func reloadTableViews(){
        [sfemTableView, femTableView, hazardTableView, roomTypeTableView].forEach { tableView in
            tableView?.reloadData()
        }
    }
    
    /// reload the title of building, floor and area
    func reloadDisplay(){
        BuildingTitle.text = "Building:          " + Buildings.share.buildings[Buildings.share.currentBuilding].name
        FloorAreaTitle.text = "Floor & Area:   " + Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].name + " " + Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].name
        locationOnFireTitle.text = "location on fire: " + Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].roomOnFire.compactMap({$0.name}).joined(separator: ", ")
        areaMap.image = UIImage(named: mapMenu[Buildings.share.currentBuilding][Buildings.share.currentFloor][Buildings.share.currentArea])
    }
    
    
    
    // Allert Controller
    /// password alert to take password, if correct pperform segue to search by fem page, if incorrect activate wrong password alert to indicate the user
    func passwordAlert(_ segueIdentier: String){
        /// ALLERT - enter password
        let passwordVerification = UIAlertController(title: "Password Required", message: "Please enter the password to access further information", preferredStyle: .alert)
        
        /// BUTTON - cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        /// BUTTON - enter
        let enterPassword = UIAlertAction(title: "Enter", style: .default) { (enter) in
            if (passwordVerification.textFields?.first?.text == self.password){
                self.performSegue(withIdentifier: segueIdentier, sender: self)
            }
            else{
                self.wrongPassword()
            }
        }
        /// add textfield for user input
        passwordVerification.addTextField { (password) in
            password.placeholder = "Password"
            password.keyboardType = .numberPad
            password.isSecureTextEntry = true
        }
        /// add button for alert controller
        passwordVerification.addAction(enterPassword)
        passwordVerification.addAction(cancel)
        
        /// present the alert
        present(passwordVerification, animated: true, completion: nil)
    }
    
    /// wrong password to alert the user that he/she has entered the wrong password
    func wrongPassword(){
        /// ALLERT - wrong password
        let wrongPassword = UIAlertController(title: "Wrong Password", message: "You have enter a wrong password!", preferredStyle: .alert)
        
        /// BUTTON - cancel
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        /// add button for alert controller
        wrongPassword.addAction(cancel)
        
        /// present the alert
        present(wrongPassword, animated: true, completion: nil)
    }
    
    
    
    /// Table View Delegate
    /// decide the number of section of the tableView
    func numberOfSections(in tableView: UITableView) -> Int {
        switch tableView {
            case hazardTableView:
                return 4
            default:
                return 1
        }
    }
    
    
    
    /// decide the number of cell in (each) section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
            case sfemTableView:
                return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].sfems.count
            case femTableView:
                return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems.count
            case hazardTableView:
                return [Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.flammableGas}, Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.nonFlammableGas}, Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.radioActiveSubstance}, Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.flammableSubstance}][section].count
            default:
                return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].roomTypeMenu.count
        }
    }
    
    /// decide the style of each cell (set title)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// the cell to be added in
        let cell = UITableViewCell(style: .default, reuseIdentifier: "DefaultCell")
        
        /// string value to represent the string value (text) of the cell
        var title: String = ""
        
        switch tableView {
            case sfemTableView:
                title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].sfems[indexPath.row].name
            case femTableView:
                title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[indexPath.row].name
            case hazardTableView:
                title = [Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.flammableGas}, Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.nonFlammableGas}, Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.radioActiveSubstance}, Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.filter{ $0.flammableSubstance}][indexPath.section][indexPath.row].name
            default:
                title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].roomTypeMenu[indexPath.row] + ": " + String(Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].roomTypeNumber[indexPath.row])
        }
        /// edit the text of the cell
        cell.textLabel?.text = title
        return cell
    }
    
    /// decide the header of each (section of) tableView
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
            case sfemTableView:
                return "SFEM"
            case femTableView:
                return "FEM"
            case hazardTableView:
                return ["Flammable Gas", "Non Flammable Gas", "Radioactive Substance", "Flammable Substance"][section]
            default:
                return "RoomType"
        }
    }
    
    // decide the action after user pressed the corresponding cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
            case femTableView:
                Buildings.share.currentFEM = indexPath.row
                performSegue(withIdentifier: "ShowFEM", sender: nil)
            case sfemTableView:
                Buildings.share.currentSFEM = indexPath.row
                performSegue(withIdentifier: "ShowFEM", sender: nil)
            default: break
        }
    }
}


