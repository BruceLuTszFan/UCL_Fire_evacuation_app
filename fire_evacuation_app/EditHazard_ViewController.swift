//
//  EditHazard_ViewController.swift
//  fire_evacuation_app
//
//  Created by Lu on 18/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import UIKit

class EditHazard_ViewController: UIViewController {

    /// the room that has been selected currently
    var currentRoom: Room!
    
    // UI CONNECTION SETUP - label
    /// label to represent the room's building name
    @IBOutlet weak var buildingTitle: UILabel!
    /// label to represent the room's name
    @IBOutlet weak var roomTitle: UILabel!
    
    
    // UI CONNECTION SETUP - switch
    /// switch to represent the state of 'flammable gas' of the room
    @IBOutlet weak var flammableGasSwitch: UISwitch!
    /// switch to represent the state of 'non flammable gas' of the room
    @IBOutlet weak var nonFlammableGasSwitch: UISwitch!
    /// switch to represent the state of 'radio active substance' of the room
    @IBOutlet weak var radioActiveSubstanceSwitch: UISwitch!
    /// switch to represent the state of 'flammable substance' of the room
    @IBOutlet weak var flammableSubstanceSwitch: UISwitch!
    
    
    // UI CONNECTION SETUP - button
    /// when the done button is pressed, check if the state of hazard of the room is changed, if changed, run the 'switch hazard state' function, if not changed, pass then dismiss.
    @IBAction func doneButtonPressed(_ sender: Any) {
        if flammableGasSwitch.isOn != currentRoom.flammableGas{
            Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms[Buildings.share.currentRoom].switchFlammableGasState()
        }
        if nonFlammableGasSwitch.isOn != currentRoom.nonFlammableGas{
            Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms[Buildings.share.currentRoom].switchNonFlammableGasState()
        }
        if radioActiveSubstanceSwitch.isOn != currentRoom.radioActiveSubstance{
            Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms[Buildings.share.currentRoom].switchRadioActiveSubstanceState()
        }
        if flammableSubstanceSwitch.isOn != currentRoom.flammableSubstance{
            Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms[Buildings.share.currentRoom].switchFlammableSubstanceState()
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    // Utility Functions
    /// run when the view loads - label & switch initiation
    override func viewDidLoad() {
        super.viewDidLoad()
        currentRoom = Buildings.share.buildings[Buildings.share.currentBuilding].floors[Buildings.share.currentFloor].areas[Buildings.share.currentArea].rooms[Buildings.share.currentRoom]
        buildingTitle.text = Buildings.share.buildings[Buildings.share.currentBuilding].name
        roomTitle.text = currentRoom.name
        flammableGasSwitch.isOn = currentRoom.flammableGas
        nonFlammableGasSwitch.isOn = currentRoom.nonFlammableGas
        radioActiveSubstanceSwitch.isOn = currentRoom.radioActiveSubstance
        flammableSubstanceSwitch.isOn = currentRoom.flammableSubstance
    }
}
