//
//  SearchByFEM_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 11/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class SearchByFEM_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// UI CONNECTION SETUP - navigation bar
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    
    
    /// UI CONNECTION SETUP - table view
    /// tableView for building
    @IBOutlet weak var buildingTableView: UITableView!
    /// tableView for floor
    @IBOutlet weak var floorTableView: UITableView!
    /// tableView for area
    @IBOutlet weak var areaTableView: UITableView!
    /// tableView for FEM
    @IBOutlet weak var FEM_TableView: UITableView!
    
    
    
    /// UI CONNECTION SETUP - buttons
    /// when the add fem button is pressed, perform segue to add fem page tab
    @IBAction func AddFEMbuttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "AddFEM_PageSegue", sender: nil)
    }
    
    
    
    /// Utility Functions
    /// run when View loads - reload tableViews, reset location index
    override func viewDidLoad() {
        Buildings.share.resetAllIndex()
        reloadTableViews([buildingTableView, floorTableView, areaTableView, FEM_TableView])
    }
    
    /// run when View appears - reload tableViews, reset location index
    override func viewDidAppear(_ animated: Bool) {
        Buildings.share.resetAllIndex()
        reloadTableViews([buildingTableView, floorTableView, areaTableView, FEM_TableView])
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
        case areaTableView:
            return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas.count
        default:
            return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems.count
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
        case areaTableView:
            title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[indexPath.row].name
        default:
            title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].fems[indexPath.row].name
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
        case areaTableView:
            return "Area"
        default:
            return "FEM"
        }
    }
    
    // decide the action after user pressed the corresponding cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case buildingTableView:
            Buildings.share.currentBuilding = indexPath.row
            Buildings.share.currentFloor = 0
            Buildings.share.currentArea = 0
            reloadTableViews([buildingTableView, floorTableView, areaTableView, FEM_TableView])
        case floorTableView:
            Buildings.share.currentFloor = indexPath.row
            Buildings.share.currentArea = 0
            reloadTableViews([floorTableView, areaTableView, FEM_TableView])
        case areaTableView:
            Buildings.share.currentArea = indexPath.row
            reloadTableViews([areaTableView, FEM_TableView])
        default:
            Buildings.share.currentFEM = indexPath.row
            reloadTableViews([FEM_TableView])
            performSegue(withIdentifier: "EditFEM_PageSegue", sender: nil)
        }
        _ = tableView.cellForRow(at: indexPath)!.accessoryType = UITableViewCellAccessoryType.checkmark
    }
}



