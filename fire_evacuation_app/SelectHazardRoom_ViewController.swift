//
//  SelectHazardRoom_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 18/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class SelectHazardRoom_ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    /// UI CONNECTION SETUP - table view
    /// represent the tableView of the buliding
    @IBOutlet weak var buildingTableView: UITableView!
    /// represent the tableView of the floor
    @IBOutlet weak var floorTableView: UITableView!
    /// represent the tableView of the area
    @IBOutlet weak var areaTableView: UITableView!
    /// represent the tableView of the room
    @IBOutlet weak var roomTableView: UITableView!
    
    
    
    /// Utility Functions
    /// run when the view is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadTableViews([buildingTableView, floorTableView, areaTableView, roomTableView])
        Buildings.share.resetBuildingIndex()
    }
    
    /// run when the view appears
    override func viewDidAppear(_ animated: Bool) {
        reloadTableViews([buildingTableView, floorTableView, areaTableView, roomTableView])
        Buildings.share.resetBuildingIndex()
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
            return Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms.count
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
            title = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms[indexPath.row].name
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
            return "Room"
        }
    }
    
    // decide the action after user pressed the corresponding cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case buildingTableView:
            Buildings.share.currentBuilding = indexPath.row
            Buildings.share.currentFloor = 0
            Buildings.share.currentArea = 0
            Buildings.share.currentRoom = 0
            reloadTableViews([buildingTableView, floorTableView, areaTableView, roomTableView])
        case floorTableView:
            Buildings.share.currentFloor = indexPath.row
            Buildings.share.currentArea = 0
            Buildings.share.currentRoom = 0
            reloadTableViews([floorTableView, areaTableView, roomTableView])
        case areaTableView:
            Buildings.share.currentArea = indexPath.row
            Buildings.share.currentRoom = 0
            reloadTableViews([areaTableView, roomTableView])
        default:
            Buildings.share.currentRoom = indexPath.row
            reloadTableViews([roomTableView])
            performSegue(withIdentifier: "EditHazardRoomPageSegue", sender: nil)
        }
        _ = tableView.cellForRow(at: indexPath)!.accessoryType = UITableViewCellAccessoryType.checkmark
    }

}
