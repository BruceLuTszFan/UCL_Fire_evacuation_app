//
//  BuildingSingleton.swift
//  fire_evacuation_app
//
//  Created by Lu on 9/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import Foundation

/// fake class for saving and loading singleton classes
class FakeBuildings: Codable {
    
    private(set) var building: Building
    
    public init(_ building: Building){
        self.building = building
    }
}

/// Singleton class to represent the whole project
class Buildings: Codable {
    /// empty init for singleton class
    private init(){}
    /// singleton class declaration
    static let share = Buildings()
    
    /// the array of the buildings
    private(set) var buildings: [Building] = [initialiseRobertsBuilding(), initialiseEFB()]
    
    /// The index of building currently being selected.
    var currentBuilding: Int = 0
    
    /// The index of floor currently being selected.
    var currentFloor: Int = 0
    
    /// The index of area currently being selected.
    var currentArea: Int = 0
    
    /// The index of room currently being selected.
    var currentRoom: Int = 0
    
    /// The index of FEM selected.
    var currentFEM: Int = 0
    
    /// The index of SFEM selected.
    var currentSFEM: Int = 0
    
    /// reset all the location indexes and fem indexes
    public func resetAllIndex(){
        currentBuilding = 0
        currentFloor = 0
        currentArea = 0
        currentRoom = 0
        currentFEM = 0
        currentSFEM = 0
    }
    
    /// reset all the location indexes
    public func resetBuildingIndex(){
        currentBuilding = 0
        currentFloor = 0
        currentArea = 0
        currentRoom = 0
    }
    
    public func loadBuilding(_ loadedBuilding: [Building]){
        self.buildings = loadedBuilding
    }
}
