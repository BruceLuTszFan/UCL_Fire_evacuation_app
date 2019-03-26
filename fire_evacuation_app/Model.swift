//
//  Model.swift
//  fire_evacuation_app
//
//  Created by Lu on 9/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import Foundation
import UIKit

/// A class to represent a building.
class Building: Codable {
    
    /// The name of the building.
    private(set) var name: String
    
    /// The floors situated in the building.
    private(set) var floors: [Floor] = []
    
    /**
     Initialises a new building.
     - parameter name: The name of the building.
     */
    init(name: String) {
        self.name = name
    }
    
    /**
     Sets the floors in the building.
     - parameter floors: The floors to add.
     */
    public func setFloors(_ floors: [Floor]) {
        self.floors = floors
    }
    
    /**
     add SFEM from the floor.
     - parameter floorName: the floor that the SFEM is situated to
     - parameter newSFEM: The SFEM to add.
     */
    public func addSFEMtoFloor(_ floorName: String, newSFEM: SFEM) {
        if let index = floors.index(where: { $0.name == floorName }) {
            floors[index].addSFEM(newSFEM)
        }
    }
}

/// A class to represent a building's floor.
class Floor: Codable {
    
    /// The floor name.
    private(set) var name: String
    
    /// The rooms that are on fire
    private(set) var roomOnFire: [Room] = []
    
    /// The areas situated in the floor.
    private(set) var areas: [Area] = []
    
    /// The SFEMs situated on the floor.
    private(set) var sfems: [SFEM] = []
    
    /**
     Initialises a new floor.
     - parameter name: The floor's name.
     */
    init(name: String) {
        self.name = name
    }
    
    /**
     Sets the areas in the floor.
     - parameter areas: The areas to add.
     */
    public func setAreas(_ areas: [Area]) {
        self.areas = areas
    }
    
    /// collect all the rooms that are on fire from each area
    public func collectRoomOnFire(){
        for area in self.areas {
            self.roomOnFire.append(contentsOf: area.roomOnFire)
        }
    }
    
    /**
     Add new SFEM to the floor.
     - parameter sfem: The new SFEM to add.
     */
    public func addSFEM(_ sfem: SFEM) {
        sfem.floor = self
        sfems.append(sfem)
    }
    
    /**
     Remove SFEM from the floor.
     - parameter fem: The SFEM to remove.
     */
    public func removeSFEM(_ sfem: CommonFEM) {
        if let index = sfems.index(where: { $0.name == sfem.name }) {
            sfems.remove(at: index)
        }
    }
}

/// A class to represent an area.
class Area: Codable {
    
    /// The area name.
    private(set) var name: String
    
    /// The rooms situated on the floor.
    private(set) var rooms: [Room] = []
    
    /// The rooms that are on fire
    private(set) var roomOnFire: [Room] = []
    
    //  ["Labs", "Plant rooms", "Store Rooms", "Offices", "Seminar Rooms", "Lecture Theatres", "Print Rooms", "Cluster Rooms"]
    /// The type of rooms in each area.
    private(set) var roomTypeMenu: [String] = []
    
    /// The number of each type of rooms in each area
    private(set) var roomTypeNumber: [Int] = []
    
    // The FEMs situated on the area
    private(set) var fems: [FEM] = []
    
    /**
     Initialises a new area.
     - parameter name: The area's name.
     */
    init(_ name: String,_ roomTypeMenu: [String],_ roomTypeNumber: [Int]) {
        self.name = name
        self.roomTypeMenu = roomTypeMenu
        self.roomTypeNumber = roomTypeNumber
    }
    
    /**
     Sets the room on the area.
     - parameter rooms: The rooms to add.
     */
    public func setRooms(_ rooms: [Room]) {
        self.rooms = rooms
    }
    
    /**
     collect all the rooms that is on fire in a area to a array
     - parameter rooms: The rooms to be checked
     */
    public func collectOnFire(){
        self.roomOnFire.removeAll(keepingCapacity: false)
        for room in rooms{
            if room.onFire == true{
                self.roomOnFire.append(room)
            }
        }
    }
    
    /**
     Add new FEM to the area.
     - parameter fem: The new FEM to add.
     */
    public func addFEM(_ fem: FEM) {
        fem.area = self
        fems.append(fem)
    }
    
    /**
     Remove FEM from the area.
     - parameter fem: The FEM to remove.
     */
    public func removeFEM(_ fem: FEM) {
        if let index = fems.index(where: { $0.name == fem.name }) {
            fems.remove(at: index)
        }
    }
}

/// A class to represent an room on a area.
class Room: Codable {
    
    /// The name of the room.
    private(set) var name: String
    
    /// Whether the room is on fire
    private(set) var onFire: Bool
    
    /// The existance of flammable gas in the room.
    private(set) var flammableGas: Bool
    
    /// The existance of non-flammable gas in the room.
    private(set) var nonFlammableGas: Bool
    
    /// The existance of radio active substance in the room.
    private(set) var radioActiveSubstance: Bool
    
    /// The existance of flammable substance in the room.
    private(set) var flammableSubstance: Bool
    
    /**
     Initialises a new room.
     - parameter name: The room's name.
     - parameter flammableGas: The existance of flammable gas in the room.
     - parameter nonFlammableGas: The existance of non-flammable gas in the room.
     - parameter radioActive Substance: The existance of radio active substance in the room.
     - parameter flammableSubstance: The existance of flammable substance in the room
     */
    init(_ name: String, _ flammableGas: Bool, _ nonFlammableGas: Bool, _ radioActiveSubstance: Bool, _ flammableSubstance: Bool) {
        self.name = name
        self.onFire = false
        self.flammableGas = flammableGas
        self.nonFlammableGas = nonFlammableGas
        self.radioActiveSubstance = radioActiveSubstance
        self.flammableSubstance = flammableSubstance
    }
    
    /// switch the 'on fire' state of the room
    public func switchFireState(){
        self.onFire = !self.onFire
    }
    
    /// switch the 'flammable gas' state of the room
    public func switchFlammableGasState(){
        self.flammableGas = !self.flammableGas
    }
    
    /// switch the 'non flammable gas' state of the room
    public func switchNonFlammableGasState(){
        self.nonFlammableGas = !self.nonFlammableGas
    }
    
    /// switch the 'radio-active substance' state of the room
    public func switchRadioActiveSubstanceState(){
        self.radioActiveSubstance = !self.radioActiveSubstance
    }
    
    /// switch the 'flammable substance' state of the room
    public func switchFlammableSubstanceState(){
        self.flammableSubstance = !self.flammableSubstance
    }
}

class CommonFEM: Codable {
    
    /// The name of the FEM
    private(set) var name: String
    
    /// The department that the FEM belongs to
    private(set) var department: String
    
    /// The FEM's email
    private(set) var email: String
    
    /// The FEM's date of training
    private(set) var dateOfTraining: String
    
    /**
     Initialises a new FEM.
     - parameter name: The FEM's name
     - parameter department: The department that the FEM belongs to
     - parameter email: The FEM's email
     - parameter dateOfTraining: The FEM's date of training
     */
    init(_ name:String, _ department:String, _ email:String, _ dateOfTraining:String){
        self.name = name
        self.department = department
        self.email = email
        self.dateOfTraining = dateOfTraining
    }
}

/// A class to represent a FEM
class FEM: CommonFEM{
    /// The area which this FEM is situated on.
    weak fileprivate(set) var area: Area!
}


/// A class to represent a SFEM
class SFEM: CommonFEM{
    /// The floor which this SFEM is situated on.
    weak fileprivate(set) var floor: Floor!
}
