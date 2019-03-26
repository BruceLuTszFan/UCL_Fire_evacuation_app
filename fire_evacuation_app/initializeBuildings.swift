//
//  initializeBuildings.swift
//  fire_evacuation_app
//
//  Created by Lu on 9/4/2018.
//  Copyright © 2018年 Lu. All rights reserved.
//

import Foundation
import Disk

func initialiseRobertsBuilding() -> Building{
    
    // Building
    /// the object of Roberts Building
    let RobertsBuilding = Building(name: "Roberts Building")
    
    
    
    // Floor
    /// The Lower Basement of Roberts Building
    let RB_LB = Floor(name: "LB")
    /// The Upper Basement of Roberts Building
    let RB_UB = Floor(name: "UB")
    /// The Ground Floor of Roberts Building
    let RB_G = Floor(name: "GF")
    /// The 1st Floor of Roberts Building
    let RB_F01 = Floor(name: "1F")
    /// The 2nd Floor of Roberts Building
    let RB_F02 = Floor(name: "2F")
    /// The 3rd Floor of Roberts Building
    let RB_F03 = Floor(name: "3F")
    /// The 4th Floor of Roberts Building
    let RB_F04 = Floor(name: "4F")
    /// The 5th Floor of Roberts Building
    let RB_F05 = Floor(name: "5F")
    /// The 6th Floor of Roberts Building
    let RB_F06 = Floor(name: "6F")
    /// The 7th Floor of Roberts Building
    let RB_F07 = Floor(name: "7F")
    /// The 8th Floor of Roberts Building
    let RB_F08 = Floor(name: "8F")
    /// The 9th Floor of Roberts Building
    let RB_F09 = Floor(name: "9F")
    /// The 10th Floor of Roberts Building
    let RB_F10 = Floor(name: "10F")
    /// The 11th Floor of Roberts Building
    let RB_F11 = Floor(name: "11F")
    /// The roof of Roberts Building
    let RB_Roof = Floor(name: "Roof")
    
    // Add all floors into the Roberts Building
    RobertsBuilding.setFloors([RB_LB,
                               RB_UB,
                               RB_G,
                               RB_F01,
                               RB_F02,
                               RB_F03,
                               RB_F04,
                               RB_F05,
                               RB_F06,
                               RB_F07,
                               RB_F08,
                               RB_F09,
                               RB_F10,
                               RB_F11,
                               RB_Roof])

    
    // Area
    //LB
    let LB_A = Area("area A", ["Lab", "Plant Room", "Store", "Duct", "Lift", "Server", "Corridor", "Lobby", "Other"], [5, 3, 4, 4, 1, 1, 11, 2, 15])
    let LB_B = Area("area B", ["Lab", "Workshop", "Other"], [9, 1, 1])
    RB_LB.setAreas([LB_A, LB_B])
    
    //UG
    let UB_A = Area("area A", ["Lab", "Plant Room", "Store", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "Cluster Room", "Corridor", "Hub"], [2, 4, 3, 6, 2, 1, 2, 1, 2, 8, 1])
    let UB_B = Area("area B", ["Office", "Lab", "WC", "Lobby"], [3, 6, 3, 1])
    RB_UB.setAreas([UB_A,UB_B])
    
    //G
    let G_A = Area("area A", ["Lecture Theatre", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "ELEC CUPD", "Comms", "Corridor", "Other"], [2, 4, 2, 1, 5, 4, 2, 1, 6, 6])
    let G_B = Area("area B", ["Office", "Lab", "Plant Room", "Store", "Duct", "Lift", "Cleaner Room", "Work Room", "Lobby", "WC", "Corridor", "Other"], [2, 1, 3, 1, 5, 1, 1, 1, 1, 1, 4, 2])
    RB_G.setAreas([G_A,G_B])
    
    //F01
    let F01_A = Area("area A", ["Lecture Theatre", "Seminar Room", "Office", "Classroom", "Store", "Duct", "Lift", "Lobby", "WC", "ELEC CUPD", "Hub", "Corridor", "Other"], [1, 1, 4, 4, 1, 4, 1, 2, 2, 1, 1, 4, 1])
    let F01_B = Area("area B", ["Lab", "Plant Room", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "ELEC CUPD", "Corridor", "Other"], [2, 1, 4, 1, 1, 3, 1, 1, 3, 17])
    RB_F01.setAreas([F01_A,F01_B])
    
    //F02
    let F02_A = Area("area A", ["Lab", "Office", "Duct", "Lift", "Lobby", "WC", "Corridor", "Other"], [3, 13, 1, 2, 1, 4, 1, 1, 1, 2, 1])
    let F02_B = Area("area B", ["Lab", "Office", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "Corridor", "Other"], [2, 3, 2, 1, 1, 3, 2, 2, 3])
    let F02_C = Area("area C", ["Office", "Library", "Store", "Corridor", "Other"], [4, 1, 1, 1, 1])
    RB_F02.setAreas([F02_A,F02_B,F02_C])
    
    //F03
    let F03_A = Area("area A", ["Lab", "Office", "Duct", "Lift", "Lobby", "WC", "Corridor"], [5, 8, 4, 1, 1, 1, 2])
    let F03_B = Area("area B", ["Lecture Theatre", "Office", "Classroom", "Store", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "Corridor", "Other"], [1, 7, 1, 2, 3, 1, 1, 1, 2, 4, 1])
    RB_F03.setAreas([F03_A,F03_B])
    
    //F04
    let F04_A = Area("area A", ["Office", "Clsasroom", "Store", "Duct", "Lift", "Lobby", "WC", "Equipment", "Meeting Room", "Staff Room", "Reception", "Corridor"], [12, 1, 3, 4, 1, 1, 1, 1, 1, 1, 1, 2])
    let F04_B = Area("area B", ["Lecture Theatre", "Office", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "Corridor"], [2, 8, 3, 1, 1, 1, 2, 5])
    RB_F04.setAreas([F04_A,F04_B])
    
    //F05
    let F05_A = Area("area A", ["Office", "Library", "Archives", "Workshop", "Seminar Room", "Hub", "ELEC CUPD", "Kitchen", "Duct", "Lift", "WC", "Corridor", "Other"], [10, 1, 1, 1, 1, 1, 1, 1, 4, 1, 1, 3, 2])
    let F05_B = Area("area B", ["Lecture Theatre", "Lab", "Office", "Duct", "Lift", "WC", "Corridor", "Other"], [1, 1, 9, 3, 1, 1, 2, 2, 2, 1])
    RB_F05.setAreas([F05_A,F05_B])
    
    //F06
    let F06_A = Area("area A", ["Lab", "Office", "Plant Room", "Equipment Room", "Copy Room", "Duct", "Lift", "WC", "Corridor"], [5, 6, 1, 1, 1, 4, 1, 1, 4])
    let F06_B = Area("area B", ["Lab", "Office", "Store", "Workshop", "Duct", "Lift", "Cleaner Room", "Lobby", "WC", "Corridor"], [1, 1, 2, 1, 3, 1, 1, 1, 2, 2])
    RB_F06.setAreas([F06_A,F06_B])
    
    //F07
    let F07_A = Area("area A", ["Lab", "Office", "Work Room", "Cluster Room", "Copy Room", "Duct", "Lift", "WC", "Corridor"], [5, 6, 1, 1, 1, 4, 1, 1, 4])
    RB_F07.setAreas([F07_A])
    
    //F08
    let F08_A = Area("area A", ["Lab", "Office", "Work Room", "Store", "Meeting Room", "Kitchen", "Copy Room", "Duct", "Lobby", "Lidt", "WC", "Corridor"], [2, 4, 2, 1, 1, 1, 1, 5, 2, 2, 1, 3])
    RB_F08.setAreas([F08_A])
    
    //F09
    let F09_A = Area("area A", ["Lab", "Office", "Seminar Room", "Copy Room", "Duct", "Lift", "Lobby", "WC", "Corridor", "Other"], [4, 6, 1, 1, 5, 2, 2, 1, 3, 2])
    RB_F09.setAreas([F09_A])
    
    //F10
    let F10_A = Area("area A", ["Lab", "Office", "Work Room", "Plant Room", "Store", "Duct", "ELEC CUPD", "Lift Motor Room", "Lobby", "Corridor"], [3, 3, 4, 2, 1, 4, 1, 2, 1, 6])
    RB_F10.setAreas([F10_A])
    
    //F11
    let F11_A = Area("area A", ["Lab", "Office", "Work Room", "Meeting Room", "Server Room", "Plant Room", "Cleaner Room", "WC", "Corridor"], [2, 14, 3, 1, 1, 2, 1, 2, 5])
    RB_F11.setAreas([F11_A])
    
    //Roof -- no room
    let Roof_A = Area("area A", [], [])
    RB_Roof.setAreas([Roof_A])
    
    
    
    // Room
    //LOWER BASEMENT
    let LB01 = Room("LB01", false, false, false, false)  //  LB01-LB05 have no room type
    let LB02 = Room("LB02", false, false, false, false)
    let LB03 = Room("LB03", false, false, false, false)
    let LB04 = Room("LB04", false, false, false, false)
    let LB05 = Room("LB05", false, false, false, false)
    let LB06 = Room("LB06", false, false, false, false)
    let LB07 = Room("LB07", false, false, false, false)
    let LB07A = Room("LB07A", false, false, false, false)
    let LB07B = Room("LB07B", false, false, false, false)
    let LB08 = Room("LB08", false, false, false, false)
    let LB08A = Room("LB08A", false, false, false, false)
    let LB08B = Room("LB08B", false, false, false, false)
    let LB10 = Room("LB10", false, false, false, false)
    let LB11 = Room("LB11", false, false, false, false)
    let LB13 = Room("LB13", false, false, false, false)
    let LB14 = Room("LB14", false, false, false, false)
    let LB15 = Room("LB15", false, false, false, false)
    let LB16 = Room("LB16", false, false, false, false)
    let LB16A = Room("LB16A", false, false, false, false)
    let LB16B = Room("LB16B", false, false, false, false)
    let LB17 = Room("LB17", false, false, false, false)
    let LB17A = Room("LB17A", false, false, false, false)
    let LB17B = Room("LB17B", false, false, false, false)
    let LB18 = Room("LB18", false, false, false, false)
    let LB19 = Room("LB19", false, false, false, false)
    let LB20 = Room("LB20", false, false, false, false)
    let LB21 = Room("LB21", false, false, false, false)
    let LB22 = Room("LB22", false, false, false, false)
    let LB23 = Room("LB23", false, false, false, false)
    let LB24 = Room("LB24", false, false, false, false)
    let LB25 = Room("LB25", false, false, false, false)
    let LB26 = Room("LB26", false, false, false, false)
    let LB28 = Room("LB28", false, false, false, false)
    let LB29 = Room("LB29", false, false, false, false)
    let LB30 = Room("LB30", false, false, false, false)
    let LB31 = Room("LB31", false, false, false, false)
    let LB32 = Room("LB32", false, false, false, false)
    let LB51 = Room("LB51", false, false, false, false)
    let LB80 = Room("LB80", false, false, false, false)
    let LB81 = Room("LB81", false, false, false, false)
    let LB83 = Room("LB83", false, false, false, false)
    let LB84 = Room("LB84", false, false, false, false)
    let LB85 = Room("LB85", false, false, false, false)
    let LB86 = Room("LB86", false, false, false, false)
    let LB87 = Room("LB87", false, false, false, false)
    let LB88 = Room("LB88", false, false, false, false)
    let LB89 = Room("LB89", false, false, false, false)
    let LB90 = Room("LB90", false, false, false, false)
    let LB91 = Room("LB91", false, false, false, false)
    let LB92 = Room("LB92", false, false, false, false)
    let LB93 = Room("LB93", false, false, false, false)
    let LB94 = Room("LB94", false, false, false, false)
    let LB95 = Room("LB95", false, false, false, false)
    let LB96 = Room("LB96", false, false, false, false)
    let LB97 = Room("LB97", false, false, false, false)
    let LB98 = Room("LB98", false, false, false, false)
    let LB99 = Room("LB99", false, false, false, false)
    LB_A.setRooms([LB01, LB02, LB03, LB04, LB05, LB06, LB07, LB07A, LB07B, LB08, LB08A, LB08B, LB10, LB11, LB14, LB15, LB16, LB16A, LB16B, LB17, LB17A, LB17B,LB28, LB29, LB30, LB31, LB32, LB51, LB80, LB81, LB83, LB84, LB85, LB86, LB87, LB88, LB89, LB90, LB91, LB92, LB93, LB94, LB95, LB96,
        LB97,LB98,LB99])
    LB_B.setRooms([LB13,LB18, LB19, LB20, LB21, LB22, LB23, LB24, LB25, LB26])
    
    
    // UNDER BASEMENT
    let UB01 = Room("UB01", false, false, false, false)
    let UB02 = Room("UB02", false, false, false, false)
    let UB03 = Room("UB03", false, false, false, false)
    let UB04 = Room("UB04", false, false, false, false)
    let UB05 = Room("UB05", false, false, false, false)
    let UB06A = Room("UB06A", false, false, false, false)
    let UB06B = Room("UB06B", false, false, false, false)
    let UB07 = Room("UB07", false, false, false, false)
    let UB08 = Room("UB08", false, false, false, false)
    let UB09 = Room("UB09", false, false, false, false)
    let UB09A = Room("UB09A", false, false, false, false)
    let UB10 = Room("UB10", false, false, false, false)
    let UB11 = Room("UB11", false, false, false, false)
    let UB12 = Room("UB12", false, false, false, false)
    let UB13 = Room("UB13", false, false, false, false)
    let UB14 = Room("UB14", false, false, false, false)
    let UB15 = Room("UB15", false, false, false, false)
    let UB16 = Room("UB16", false, false, false, false)
    let UB51 = Room("UB51", false, false, false, false)
    let UB52 = Room("UB52", false, false, false, false)
    let UB52A = Room("UB52A", false, false, false, false)
    let UB53 = Room("UB53", false, false, false, false)
    let UB54 = Room("UB54", false, false, false, false)
    let UB55 = Room("UB55", false, false, false, false)
    let UB56 = Room("UB56", false, false, false, false)
    let UB80 = Room("UB80", false, false, false, false)
    let UB82 = Room("UB82", false, false, false, false)
    let UB82A = Room("UB82A", false, false, false, false)
    let UB82B = Room("UB82B", false, false, false, false)
    let UB83 = Room("UB83", false, false, false, false)
    let UB84 = Room("UB84", false, false, false, false)
    let UB84A = Room("UB84A", false, false, false, false)
    let UB85 = Room("UB85", false, false, false, false)
    let UB86 = Room("UB86", false, false, false, false)
    let UB87 = Room("UB87", false, false, false, false)
    let UB88 = Room("UB88", false, false, false, false)
    let UB89 = Room("UB89", false, false, false, false)
    let UB90 = Room("UB90", false, false, false, false)
    let UB91 = Room("UB91", false, false, false, false)
    let UB93 = Room("UB93", false, false, false, false)
    let UB94 = Room("UB94", false, false, false, false)
    let UB95 = Room("UB95", false, false, false, false)
    let UB96 = Room("UB96", false, false, false, false)
    let UB98 = Room("UB98", false, false, false, false)
    let UB99 = Room("UB99", false, false, false, false)        //ROOM 99 HAS NO ROOM TYPE
    UB_A.setRooms([UB01, UB02, UB03, UB04, UB06A, UB06B, UB51, UB52, UB52A, UB53, UB54,UB55,UB56,UB80, UB82, UB82A, UB82B, UB83, UB84, UB84A, UB85, UB86, UB87, UB88, UB89, UB90, UB91, UB93, UB94, UB95, UB96, UB98, UB99])
    UB_B.setRooms([UB04,UB05, UB07, UB08, UB09,UB09A,UB10, UB11, UB12, UB13, UB14, UB15, UB16])
    
    
    //Ground Floor
    let G01 = Room("G01", false, false, false, false)
    let G01A = Room("G01A", false, false, false, false)
    let G02 = Room("G02", false, false, false, false)
    let G02A = Room("G02A", false, false, false, false)
    let G02B = Room("G02B", false, false, false, false)
    let G02C = Room("G02C", false, false, false, false)
    let G03 = Room("G03", false, false, false, false)
    let G03B = Room("G03B", false, false, false, false)
    let G03C = Room("G03C", false, false, false, false)        //ROOM G03C HAS NO ROOM TYPE
    let G03D = Room("G03D", false, false, false, false)
    let G04 = Room("G04", false, false, false, false)
    let G05 = Room("G05", false, false, false, false)
    let G06 = Room("G06", false, false, false, false)
    let G07 = Room("G07", false, false, false, false)
    let G07A = Room("G07A", false, false, false, false)
    let G08 = Room("G08", false, false, false, false)
    let G09 = Room("G09", false, false, false, false)
    let G10 = Room("G10", false, false, false, false)
    let G12 = Room("G12", false, false, false, false)
    let G13 = Room("G13", false, false, false, false)
    let G13A = Room("G13A", false, false, false, false)
    let G15 = Room("G15", false, false, false, false)
    let XG17 = Room("XG17", false, false, false, false)
    let XG17A = Room("XG17A", false, false, false, false)
    let XG18 = Room("XG18", false, false, false, false)
    let XG19 = Room("XG19", false, false, false, false)
    let XG20 = Room("XG20", false, false, false, false)
    let XG21 = Room("XG21", false, false, false, false)
    let XG23 = Room("XG23", false, false, false, false)
    let XG24 = Room("XG24", false, false, false, false)
    // unknown room
    let G79 = Room("G79", false, false, false, false)
    let G79A = Room("G79A", false, false, false, false)
    let G79B = Room("G79B", false, false, false, false)
    let G80 = Room("G80", false, false, false, false)
    let G81 = Room("G81", false, false, false, false)
    let G82 = Room("G82", false, false, false, false)
    let G83 = Room("G83", false, false, false, false)
    let G84 = Room("G84", false, false, false, false)
    let G85 = Room("G85", false, false, false, false)
    let G86 = Room("G86", false, false, false, false)
    let G87 = Room("G87", false, false, false, false)
    let G89 = Room("G89", false, false, false, false)
    let G90 = Room("G90", false, false, false, false)
    let G91 = Room("G91", false, false, false, false)
    let G92 = Room("G92", false, false, false, false)
    let G93 = Room("G93", false, false, false, false)
    let G95 = Room("G95", false, false, false, false)
    let G96 = Room("G96", false, false, false, false)
    let G97 = Room("G97", false, false, false, false)
    let G98 = Room("G98", false, false, false, false)
    let G99 = Room("G99", false, false, false, false)
    G_A.setRooms([G01, G01A, G02, G02A, G02B, G02C, G03, G03B, G03C, G03D, G04, G05, G06,G07, G07A, G08, G09, G10, G80, G89, G90, G91, G92, G93, G95, G96, G97, G98, G99])
    G_B.setRooms([G12,G13, G13A, G15, XG17, XG17A, XG18, XG19,XG20, XG21, XG23, XG24, G79, G79A, G79B,G80,G81, G82, G83, G84, G85, G86, G87])
    
    
    //1ST FLOOR
    let F101 = Room("101", false, false, false, false)
    let F102 = Room("102", false, false, false, false)
    let F103 = Room("103", false, false, false, false)
    let F104 = Room("104", false, false, false, false)
    let F105A = Room("105A", false, false, false, false)
    let F105B = Room("105A", false, false, false, false)
    let F106 = Room("106", false, false, false, false)
    let F107 = Room("107", false, false, false, false)
    let F108 = Room("108", false, false, false, false)
    let F109 = Room("109", false, false, false, false)
    let F110 = Room("110", false, false, false, false)
    let F111 = Room("111", false, false, false, false)
    let F112 = Room("112", false, false, false, false)
    let F112A = Room("112A", false, false, false, false)
    let F113 = Room("113", false, false, false, false)
    let F113A = Room("113A", false, false, false, false)
    let F114 = Room("114", false, false, false, false)
    let F115A = Room("115A", false, false, false, false)
    let F115B = Room("115B", false, false, false, false)
    let F116A = Room("116A", false, false, false, false)
    let F116B = Room("116B", false, false, false, false)
    let F117A = Room("117A", false, false, false, false)        //ROOM 117A,117C,117D HAVE NO ROOM TYPE
    let F117B = Room("117B", false, false, false, false)
    let F117C = Room("117C", false, false, false, false)
    let F117D = Room("117D", false, false, false, false)
    let F118A = Room("118A", false, false, false, false)
    let F118B = Room("118B", false, false, false, false)
    let F119 = Room("119", false, false, false, false)
    let F119A = Room("119A", false, false, false, false)
    let F120 = Room("120", false, false, false, false)
    let F121 = Room("121", false, false, false, false)
    let F122 = Room("122", false, false, false, false)        //ROOM 122,123,124,125A HAVE NO ROOM TYPE
    let F123 = Room("123", false, false, false, false)
    let F124 = Room("124", false, false, false, false)
    let F124A = Room("F124A", false, false, false, false)
    let F125 = Room("125", false, false, false, false)
    let F125A = Room("125A", false, false, false, false)
    // unknown room
    let F179 = Room("179", false, false, false, false)
    let F179A = Room("179A", false, false, false, false)
    let F179B = Room("179B", false, false, false, false)
    let F179C = Room("179C", false, false, false, false)
    let F179D = Room("179D", false, false, false, false)
    let F180 = Room("180", false, false, false, false)
    let F181 = Room("181", false, false, false, false)
    let F182 = Room("182", false, false, false, false)
    let F183 = Room("183", false, false, false, false)
    let F184 = Room("184", false, false, false, false)
    let F185 = Room("185", false, false, false, false)
    let F186 = Room("186", false, false, false, false)
    let F187 = Room("187", false, false, false, false)
    let F188 = Room("188", false, false, false, false)
    let F189 = Room("189", false, false, false, false)
    let F190 = Room("190", false, false, false, false)
    let F191 = Room("191", false, false, false, false)
    let F192 = Room("192", false, false, false, false)
    let F193 = Room("193", false, false, false, false)
    let F194 = Room("194", false, false, false, false)
    let F195 = Room("195", false, false, false, false)
    let F196 = Room("196", false, false, false, false)
    let F197 = Room("197", false, false, false, false)
    let F198 = Room("198", false, false, false, false)
    let F199 = Room("199", false, false, false, false)
    F01_A.setRooms([F101, F102, F103, F104, F105A, F105B, F106, F107, F108, F109, F110, F111, F112, F112A, F113, F113A,F188,F189, F190, F191, F192, F193, F194,F195, F196,F197,F198,F199])
    F02_B.setRooms([F114, F115A, F115B, F116A, F116B, F117A, F117B,F117C,F117D, F118A, F118B,F119, F119A, F120, F121, F122,F123, F124, F124A, F125, F125A,F179,F179A, F179B, F179C, F179D, F180,
                    F181, F182, F183, F184, F185, F186, F187])


    //2ND FLOOR
    let F201 = Room("201", false, false, false, false)
    let F202 = Room("202", false, false, false, false)
    let F203 = Room("203", false, false, false, false)
    let F203A = Room("203A", false, false, false, false)
    let F203B = Room("203B", false, false, false, false)
    let F204 = Room("204", false, false, false, false)
    let F205 = Room("205", false, false, false, false)
    let F205A = Room("205A", false, false, false, false)
    let F206 = Room("206", false, false, false, false)
    let F207 = Room("207", false, false, false, false)
    let F208 = Room("208", false, false, false, false)
    let F209 = Room("209", false, false, false, false)
    let F210A = Room("210A", false, false, false, false)
    let F210B = Room("210B", false, false, false, false)
    let F211 = Room("211", false, false, false, false)
    let F212 = Room("212", false, false, false, false)
    let F212A = Room("212A", false, false, false, false)
    let F212B = Room("212B", false, false, false, false)
    let F213 = Room("213", false, false, false, false)
    let F214 = Room("214", false, false, false, false)
    let F215 = Room("215", false, false, false, false)
    let F217 = Room("217", false, false, false, false)
    let F218 = Room("218", false, false, false, false)
    let F218A = Room("218A", false, false, false, false)
    let F220 = Room("220", false, false, false, false)
    let F221 = Room("221", false, false, false, false)
    let F222 = Room("222", false, false, false, false)
    let F223 = Room("223", false, false, false, false)
    let F224 = Room("224", false, false, false, false)
    let F224A = Room("224A", false, false, false, false)
    let F224B = Room("224B", false, false, false, false)
    let F224C = Room("224C", false, false, false, false)
    let F225 = Room("225", false, false, false, false)
    let F226 = Room("226", false, false, false, false)
    let F227 = Room("227", false, false, false, false)
    let F228 = Room("228", false, false, false, false)
    let F229 = Room("229", false, false, false, false)
    let F230 = Room("230", false, false, false, false)
    let F231 = Room("231", false, false, false, false)
    let F232 = Room("232", false, false, false, false)
    let F232A = Room("232A", false, false, false, false)
    // unknown room
    let F281 = Room("281", false, false, false, false)
    let F282 = Room("282", false, false, false, false)
    let F283 = Room("283", false, false, false, false)
    let F284 = Room("284", false, false, false, false)
    let F285 = Room("285", false, false, false, false)
    let F286 = Room("286", false, false, false, false)
    let F287 = Room("287", false, false, false, false)
    let F288 = Room("288", false, false, false, false)
    let F289 = Room("289", false, false, false, false)
    let F290 = Room("290", false, false, false, false)
    let F291 = Room("291", false, false, false, false)
    let F292 = Room("292", false, false, false, false)
    let F293 = Room("293", false, false, false, false)
    let F294 = Room("294", false, false, false, false)
    let F295 = Room("295", false, false, false, false)
    let F296 = Room("296", false, false, false, false)
    let F297 = Room("297", false, false, false, false)
    let F298 = Room("298", false, false, false, false)
    let F299 = Room("299", false, false, false, false)
    F02_A.setRooms([F201, F202, F203,F203A, F203B, F204, F205, F205A, F206, F207, F208, F209, F209, F209, F210A, F210B, F211, F212A, F212, F212B, F213, F214, F215, F292, F293, F294, F295, F296, F297, F298, F299])
    F02_B.setRooms([F217,F218, F218A, F220, F221, F222, F223, F224, F224A, F224B, F224C, F225, F282, F283, F284, F285, F286, F287, F288, F289, F290, F291])
    F02_C.setRooms([F226, F227, F228, F229, F230, F231, F232, F232A, F281])

    
    //    //3RD FLOOR
    let F301 = Room("301", false, false, false, false)
    let F302 = Room("302", false, false, false, false)
    let F303 = Room("303", false, false, false, false)
    let F303A = Room("303A", false, false, false, false)
    let F303B = Room("303B", false, false, false, false)
    let F303C = Room("303C", false, false, false, false)
    let F303D = Room("303D", false, false, false, false)
    let F303E = Room("303E", false, false, false, false)
    let F304 = Room("304", false, false, false, false)
    let F305 = Room("305", false, false, false, false)
    let F306A = Room("306A", false, false, false, false)
    let F306B = Room("306B", false, false, false, false)
    let F306C = Room("306C", false, false, false, false)
    let F306 = Room("306", false, false, false, false)
    let F307 = Room("307", false, false, false, false)
    let F308 = Room("308", false, false, false, false)
    let F308A = Room("308A", false, false, false, false)
    let F309 = Room("309", false, false, false, false)
    let F310 = Room("310", false, false, false, false)
    let F310A = Room("310A", false, false, false, false)
    let F310B = Room("310B", false, false, false, false)
    let F311 = Room("311", false, false, false, false)
    let F311A = Room("311A", false, false, false, false)
    let F312 = Room("312", false, false, false, false)
    let F313 = Room("313", false, false, false, false)
    let F314 = Room("314", false, false, false, false)
    let F315 = Room("315", false, false, false, false)
    let F316 = Room("316", false, false, false, false)
    let F317 = Room("317", false, false, false, false)
    // unknown room
    let F382 = Room("382", false, false, false, false)
    let F383 = Room("383", false, false, false, false)
    let F384 = Room("384", false, false, false, false)
    let F385 = Room("385", false, false, false, false)
    let F386 = Room("386", false, false, false, false)
    let F387 = Room("387", false, false, false, false)
    let F388 = Room("388", false, false, false, false)
    let F389 = Room("389", false, false, false, false)
    let F390 = Room("390", false, false, false, false)
    let F391 = Room("391", false, false, false, false)
    let F392 = Room("392", false, false, false, false)
    let F393 = Room("393", false, false, false, false)
    let F394 = Room("394", false, false, false, false)
    let F395 = Room("395", false, false, false, false)
    let F396 = Room("396", false, false, false, false)
    let F397 = Room("397", false, false, false, false)
    let F398 = Room("398", false, false, false, false)
    let F399 = Room("399", false, false, false, false)
    F03_A.setRooms([F308, F308A, F309, F310, F310A, F310B, F311, F311A, F312, F313, F314, F315, F316, F317,F382,F383, F384, F385, F386, F387, F388, F389, F390, F391])
    F03_B.setRooms([F301, F302, F303, F303A, F303B, F303C, F303D, F303E, F304, F305, F306, F306A, F306B, F306C, F307,F392, F393, F394, F395, F396, F397, F398, F399])
    

    //4TH FLOOR
    let F401 = Room("401", false, false, false, false)
    let F402 = Room("402", false, false, false, false)
    let F403 = Room("402", false, false, false, false)
    let F404 = Room("404", false, false, false, false)
    let F405 = Room("405", false, false, false, false)
    let F406 = Room("406", false, false, false, false)
    let F407 = Room("407", false, false, false, false)
    let F408 = Room("408", false, false, false, false)
    let F409 = Room("409", false, false, false, false)
    let F410 = Room("410", false, false, false, false)
    let F411 = Room("411", false, false, false, false)
    let F412 = Room("412", false, false, false, false)
    let F412A = Room("412A", false, false, false, false)
    let F412B = Room("412B", false, false, false, false)
    let F412C = Room("412C", false, false, false, false)
    let F412D = Room("412D", false, false, false, false)
    let F412E = Room("412E", false, false, false, false)
    let F413 = Room("413", false, false, false, false)
    let F415 = Room("415", false, false, false, false)
    let F417 = Room("417", false, false, false, false)
    let F419 = Room("419", false, false, false, false)
    let F420 = Room("420", false, false, false, false)
    let F420A = Room("420A", false, false, false, false)
    let F421 = Room("421", false, false, false, false)
    let F422 = Room("422", false, false, false, false)
    let F423 = Room("423", false, false, false, false)
    let F424 = Room("424", false, false, false, false)
    let F425 = Room("425", false, false, false, false)
    let F426 = Room("426", false, false, false, false)
    let F427 = Room("427", false, false, false, false)
    let F428 = Room("428", false, false, false, false)
    let F429 = Room("429", false, false, false, false)
    let F430 = Room("430", false, false, false, false)
    // unknown room
    let F482 = Room("482", false, false, false, false)
    let F483 = Room("483", false, false, false, false)
    let F484 = Room("484", false, false, false, false)
    let F485 = Room("485", false, false, false, false)
    let F486 = Room("486", false, false, false, false)
    let F487 = Room("487", false, false, false, false)
    let F488 = Room("488", false, false, false, false)
    let F489 = Room("489", false, false, false, false)
    let F490 = Room("490", false, false, false, false)
    let F491 = Room("491", false, false, false, false)
    let F492 = Room("492", false, false, false, false)
    let F493 = Room("493", false, false, false, false)
    let F494 = Room("494", false, false, false, false)
    let F495 = Room("495", false, false, false, false)
    let F496 = Room("496", false, false, false, false)
    let F497 = Room("497", false, false, false, false)
    let F498 = Room("498", false, false, false, false)
    let F499 = Room("499", false, false, false, false)
    F04_A.setRooms([F401, F402, F403, F404, F405, F406, F407, F408, F409, F410, F411, F412, F412A, F412B, F412C, F412D, F412E, F413, F415,F417, F419, F492, F493, F494, F495, F496, F497, F498, F499])
    F04_B.setRooms([F420, F420A, F421, F422, F423, F424, F425, F426, F427, F428, F429, F430, F482, F483, F484, F485, F486, F487, F488, F489, F490, F491])
    
    
    //5TH FLOOR
    let F501 = Room("501", false, false, false, false)
    let F502 = Room("502", false, false, false, false)
    let F503A = Room("503A", false, false, false, false)
    let F503B = Room("503B", false, false, false, false)
    let F503C = Room("503C", false, false, false, false)
    let F503D = Room("503D", false, false, false, false)
    let F503E = Room("503E", false, false, false, false)
    let F503F = Room("503F", false, false, false, false)
    let F503G = Room("503G", false, false, false, false)
    let F503H = Room("503H", false, false, false, false)
    let F503H1 = Room("503H1", false, false, false, false)
    let F503J = Room("503J", false, false, false, false)
    let F503K = Room("503K", false, false, false, false)
    let F504 = Room("504", false, false, false, false)
    let F504A = Room("504A", false, false, false, false)
    let F504B = Room("504B", false, false, false, false)
    let F504C = Room("504C", false, false, false, false)
    let F505 = Room("505", false, false, false, false)
    let F505A = Room("505A", false, false, false, false)
    let F507 = Room("507", false, false, false, false)
    let F507A = Room("507A", false, false, false, false)
    let F508 = Room("508", false, false, false, false)
    let F509 = Room("509", false, false, false, false)
    let F509A = Room("509A", false, false, false, false)
    let F510 = Room("510", false, false, false, false)
    let F510A = Room("510A", false, false, false, false)
    let F510B = Room("510B", false, false, false, false)
    let F510C = Room("510C", false, false, false, false)
    let F510D = Room("510D", false, false, false, false)
    let F511 = Room("511", false, false, false, false)
    let F512 = Room("512", false, false, false, false)
    let F513 = Room("513", false, false, false, false)
    // unknown room
    let F581 = Room("581", false, false, false, false)
    let F581A = Room("581A", false, false, false, false)
    let F581B = Room("581B", false, false, false, false)
    let F583 = Room("583", false, false, false, false)
    let F584 = Room("584", false, false, false, false)
    let F585 = Room("585", false, false, false, false)
    let F586 = Room("586", false, false, false, false)
    let F587 = Room("587", false, false, false, false)
    let F588 = Room("588", false, false, false, false)
    let F589 = Room("589", false, false, false, false)
    let F590 = Room("590", false, false, false, false)
    let F591 = Room("591", false, false, false, false)
    let F592 = Room("592", false, false, false, false)
    let F593 = Room("593", false, false, false, false)
    let F594 = Room("594", false, false, false, false)
    let F595 = Room("595", false, false, false, false)
    let F596 = Room("596", false, false, false, false)
    let F597 = Room("597", false, false, false, false)
    let F598 = Room("598", false, false, false, false)
    let F599 = Room("599", false, false, false, false)
    F05_A.setRooms([F501, F502,F503A, F503B,F503C,F503D,F503E,F503F,F503E,F503G,F503H,F503H1,F503J,F503K,F504,F504A,F504B,F504C,F505,F505A, F581,F581A,F581B,F591,F592,F593,F594,F595,F596,F597,F598,F599])
    F05_B.setRooms([F507, F507A, F508, F509,F509A,F510, F510A,F510B, F510C, F510D, F511, F512, F513, F583, F584,F585,F586,F587,F588,F589,F590])
    
    
    //6TH FLOOR
    let F601 = Room("601", false, false, false, false)
    let F602 = Room("602", false, false, false, false)
    let F603 = Room("603", false, false, false, false)
    let F604 = Room("604", false, false, false, false)
    let F605 = Room("605", false, false, false, false)
    let F607 = Room("607", false, false, false, false)
    let F608 = Room("608", false, false, false, false)
    let F609 = Room("609", false, false, false, false)
    let F610 = Room("610", false, false, false, false)
    let F610B = Room("610B", false, false, false, false)
    let F611 = Room("611", false, false, false, false)
    let F612 = Room("612", false, false, false, false)
    let F615 = Room("615", false, false, false, false)
    let F617 = Room("617", false, false, false, false)
    let F619 = Room("619", false, false, false, false)
    let F620 = Room("620", false, false, false, false)
    let F620A = Room("620A", false, false, false, false)
    let F621 = Room("621", false, false, false, false)
    let F622 = Room("622", false, false, false, false)
    let F623 = Room("623", false, false, false, false)
    let F623A = Room("623A", false, false, false, false)
    let F624 = Room("624", false, false, false, false)
    // unknown room
    let F683 = Room("683", false, false, false, false)
    let F683A = Room("683A", false, false, false, false)
    let F684 = Room("684", false, false, false, false)
    let F685 = Room("685", false, false, false, false)
    let F686 = Room("686", false, false, false, false)
    let F687 = Room("687", false, false, false, false)
    let F688 = Room("688", false, false, false, false)
    let F689 = Room("689", false, false, false, false)
    let F690 = Room("690", false, false, false, false)
    let F691 = Room("691", false, false, false, false)
    let F692 = Room("692", false, false, false, false)
    let F694 = Room("694", false, false, false, false)
    let F693 = Room("693", false, false, false, false)
    let F695 = Room("695", false, false, false, false)
    let F696 = Room("696", false, false, false, false)
    let F697 = Room("697", false, false, false, false)
    let F698 = Room("698", false, false, false, false)
    let F699 = Room("699", false, false, false, false)
    F06_A.setRooms([F601,F602,F603,F604,F605,F607,F608,F609,F610,F610B,F611,F612,F615,F617,F619,F690,F691,F692,F693,F694,F695,F696,F697,F698,F699])
    F06_B.setRooms([F620,F620A,F621,F622,F623, F623A, F624,F683,F683A,F684,F685,F686,F687,F688,F689])
    
    
    //7TH FLOOR
    let F701 = Room("701", false, false, false, false)
    let F702 = Room("702", false, false, false, false)
    let F703 = Room("703", false, false, false, false)
    let F704 = Room("704", false, false, false, false)
    let F705 = Room("705", false, false, false, false)
    let F706 = Room("706", false, false, false, false)
    let F708 = Room("708", false, false, false, false)
    let F709 = Room("709", false, false, false, false)
    let F710 = Room("710", false, false, false, false)
    let F711 = Room("711", false, false, false, false)
    let F713 = Room("713", false, false, false, false)
    let F715 = Room("715", false, false, false, false)
    let F717 = Room("717", false, false, false, false)
    let F719 = Room("719", false, false, false, false)
    let F721 = Room("721", false, false, false, false)
    let RF780 = Room("R780", false, false, false, false)
    let F787 = Room("787", false, false, false, false)
    let F788 = Room("788", false, false, false, false)
    let F789 = Room("789", false, false, false, false)
    let F790 = Room("790", false, false, false, false)
    let F791 = Room("791", false, false, false, false)
    let F792 = Room("792", false, false, false, false)
    let F793 = Room("793", false, false, false, false)
    let F794 = Room("794", false, false, false, false)
    let F795 = Room("795", false, false, false, false)
    let F796 = Room("796", false, false, false, false)
    let F797 = Room("797", false, false, false, false)
    let F798 = Room("798", false, false, false, false)
    let F799 = Room("799", false, false, false, false)
    F07_A.setRooms([F701,F702,F703,F704,F705,F706,F708,F709,F710,F711,F713,F715,F717,F719,F721, RF780, F787,F788,F789,F790,F791,F792,F793,F794,F795,F796,F797,F798,F799])
    
    
    //8TH FLOOR
    let F801 = Room("801", false, false, false, false)
    let F802 = Room("802", false, false, false, false)
    let F803 = Room("803", false, false, false, false)
    let F804 = Room("804", false, false, false, false)
    let F805 = Room("805", false, false, false, false)
    let F806 = Room("806", false, false, false, false)
    let F807 = Room("807", false, false, false, false)
    let F808 = Room("808", false, false, false, false)
    let F809 = Room("809", false, false, false, false)
    let F810 = Room("810", false, false, false, false)
    let F811 = Room("811", false, false, false, false)
    let F813 = Room("813", false, false, false, false)
    let F815 = Room("815", false, false, false, false)
    // unknown room
    let F887 = Room("887", false, false, false, false)
    let F888 = Room("888", false, false, false, false)
    let F889 = Room("889", false, false, false, false)
    let F890 = Room("890", false, false, false, false)
    let F891 = Room("891", false, false, false, false)
    let F893 = Room("893", false, false, false, false)
    let F895 = Room("895", false, false, false, false)
    let F896 = Room("896", false, false, false, false)
    let F897 = Room("897", false, false, false, false)
    let F898 = Room("898", false, false, false, false)
    let F899 = Room("899", false, false, false, false)
    F08_A.setRooms([F801,F802,F803,F804,F805,F806,F807,F808,F809,F810,F811,F813,F815,F887,F888,F889,F890,F891,F893,F895,F896,F897,F898,F899])
    
    
    //9TH FLOOR
    let F901 = Room("901", false, false, false, false)
    let F902 = Room("902", false, false, false, false)
    let F903 = Room("903", false, false, false, false)
    let F904 = Room("904", false, false, false, false)
    let F905 = Room("905", false, false, false, false)
    let F906 = Room("906", false, false, false, false)
    let F908 = Room("908", false, false, false, false)
    let F910 = Room("910", false, false, false, false)
    let F911 = Room("911", false, false, false, false)
    let F913 = Room("913", false, false, false, false)
    let F915 = Room("915", false, false, false, false)
    let F917 = Room("917", false, false, false, false)
    let F919 = Room("919", false, false, false, false)
    let F912 = Room("912", false, false, false, false)
    let F914 = Room("914", false, false, false, false)
    // unknown room
    let F987 = Room("987", false, false, false, false)
    let F988 = Room("988", false, false, false, false)
    let F989 = Room("989", false, false, false, false)
    let F990 = Room("990", false, false, false, false)
    let F991 = Room("991", false, false, false, false)
    let F992 = Room("992", false, false, false, false)
    let F993 = Room("993", false, false, false, false)
    let F995 = Room("995", false, false, false, false)
    let F996 = Room("996", false, false, false, false)
    let F997 = Room("997", false, false, false, false)
    let F998 = Room("998", false, false, false, false)
    let F999 = Room("999", false, false, false, false)
    F09_A.setRooms([F901,F902,F903,F904,F905,F906,F908,F910,F911,F912,F913,F914,F915,F917,F919,F987,F988,F989,F990,F991,F992,F993,F995,F996,F997,F998,F999])
    
    
    //10TH FLOOR
    let F1001 = Room("1001", false, false, false, false)
    let F1002 = Room("1002", false, false, false, false)
    let F1003 = Room("1003", false, false, false, false)
    let F1003A = Room("1003A", false, false, false, false)
    let F1003B = Room("1003B", false, false, false, false)
    let F1005 = Room("1005", false, false, false, false)
    let F1006 = Room("1006", false, false, false, false)
    let F1007 = Room("1007", false, false, false, false)
    let F1008 = Room("1008", false, false, false, false)
    let F1009 = Room("1009", false, false, false, false)
    let F1010 = Room("1010", false, false, false, false)
    let F1012 = Room("1012", false, false, false, false)
    let F1013 = Room("1013", false, false, false, false)
    let F1014 = Room("1014", false, false, false, false)
    let F1016 = Room("1016", false, false, false, false)
    let F1018 = Room("1018", false, false, false, false)
    // unknown room
    let F1088 = Room("1088", false, false, false, false)
    let F1089 = Room("1089", false, false, false, false)
    let F1090 = Room("1090", false, false, false, false)
    let F1091 = Room("1091", false, false, false, false)
    let F1092 = Room("1092", false, false, false, false)
    let F1094 = Room("1094", false, false, false, false)
    let F1094A = Room("1094A", false, false, false, false)
    let F1095 = Room("1095", false, false, false, false)
    let F1096 = Room("1096", false, false, false, false)
    let F1097 = Room("1097", false, false, false, false)
    let F1098 = Room("1098", false, false, false, false)
    let F1099 = Room("1099", false, false, false, false)
    F10_A.setRooms([F1001,F1002,F1003,F1003A,F1003B,F1005,F1006,F1007,F1008,F1009,F1010,F1012,F1013,F1014,F1016,F1018,F1088,F1089,F1090,F1091,F1092,F1094,F1094A,F1095,F1096,F1097,F1098,F1099])
    
    
    //11TH FLOOR
    let F1100 = Room("1100", false, false, false, false)
    let F1100A = Room("1100A", false, false, false, false)
    let F1100B = Room("1100B", false, false, false, false)
    let F1100C = Room("1100C", false, false, false, false)
    let F1102 = Room("1102", false, false, false, false)
    let F1102A = Room("1102A", false, false, false, false)
    let F1103 = Room("1103", false, false, false, false)
    let F1104 = Room("1104", false, false, false, false)
    let F1105 = Room("1105", false, false, false, false)
    let F1106 = Room("1106", false, false, false, false)
    let F1106A = Room("1106A", false, false, false, false)
    let F1107 = Room("11007", false, false, false, false)
    let F1108 = Room("11008", false, false, false, false)
    let F1109 = Room("1109", false, false, false, false)
    let F1110 = Room("1110", false, false, false, false)
    let F1111 = Room("1111", false, false, false, false)
    let F1112 = Room("1112", false, false, false, false)
    let F1113 = Room("1113", false, false, false, false)
    let F1114 = Room("1114", false, false, false, false)
    let F1115 = Room("1115", false, false, false, false)
    let F1116 = Room("1116", false, false, false, false)
    let F1117 = Room("1117", false, false, false, false)
    let F1118 = Room("1118", false, false, false, false)
    let F1119 = Room("1119", false, false, false, false)
    let F1120 = Room("1120", false, false, false, false)
    let F1121 = Room("1121", false, false, false, false)
    let F1122 = Room("1122", false, false, false, false)
    //
    let F1196 = Room("1196", false, false, false, false)
    let F1197 = Room("1197", false, false, false, false)
    let F1198 = Room("1198", false, false, false, false)
    let F1199 = Room("1199", false, false, false, false)
    F11_A.setRooms([F1100,F1100A,F1100B,F1100C,F1102,F1102A,F1103,F1104,F1105,F1106,F1106A,F1107,F1108,F1109,F1110,F1111,F1112,F1113,F1114,F1115,F1116,F1117,F1118,F1119,F1120,F1121,F1122,F1196,F1197,F1198,F1199])
    
    
    
    // SFEM initialize
    let Emily = SFEM("Emily", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Oliver = SFEM("Oliver", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Eason = SFEM("Eason", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Ricky = SFEM("Ricky", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")

    // add FEM to LB
    RB_LB.addSFEM(Emily)
    // add FEM to UB
    // add FEM to Ground Floor
    // add FEM to Floor 2
    RB_F02.addSFEM(Oliver)
    // add FEM to Floor 3
    RB_F03.addSFEM(Eason)
    // add FEM to Floor 4
    RB_F04.addSFEM(Ricky)
    // add FEM to Floor 5
    // add FEM to Floor 6
    // add FEM to Floor 7
    // add FEM to Floor 8
    // add FEM to Floor 9
    // add FEM to Floor 10
    // add FEM to Floor 11
    // add FEM to Roof
    
    
    
    // FEM initialize
    let Robert = FEM("Robert", "Chemical Engineering","Robert@ucl.ac.uk", "01-01-1993")
    let Sam = FEM("Sam", "Computer Science", "Sam@ucl.ac.uk", "01-01-1993")
    let Jack = FEM("Jack", "EEE", "Jack@ucl.ac.uk", "01-01-1993")
    let Tom = FEM("Tom", "EEE", "Tom@ucl.ac.uk", "01-01-1993")
    let Macleod = FEM("Macleod", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Jayce = FEM("Jayce", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Tim = FEM("Tim", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Matt = FEM("Matt", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    let Zac = FEM("Zac", "Computer Science", "Macleod@ucl.ac.uk", "01-01-1992")
    
    // add FEM to LB Area A
    LB_A.addFEM(Robert)
    LB_A.addFEM(Sam)
    LB_A.addFEM(Macleod)
    LB_A.addFEM(Jack)
    // add FEM to LB Area B
    LB_B.addFEM(Tom)
    LB_B.addFEM(Jayce)
    LB_B.addFEM(Tim)
    LB_B.addFEM(Matt)
    LB_B.addFEM(Zac)
    
    // return the whole initialized roberts building
    return RobertsBuilding
}



func initialiseEFB() -> Building{
    
    // Building
    let EngineeringFrontBuilding = Building(name: "Engineering Front Building")
    
    
    
    // Floor
    let EFB_F01 = Floor(name: "1F")
    let EFB_F02 = Floor(name: "2F")
    let EFB_F03 = Floor(name: "3F")
    let EFB_F04 = Floor(name: "4F")
    EngineeringFrontBuilding.setFloors([EFB_F01, EFB_F02, EFB_F03, EFB_F04])
    
    
    
    // Area
    let EFB_F01_A = Area("Area A", ["Lab", "Office", "Print Room", "Staff Room", "Meeting Room", "Store Room", "Duct", "WC", "Corridor", "Other"], [1, 4, 1, 2, 1, 1, 1, 2, 2, 3])
    let EFB_F02_A = Area("Area A", ["Lab", "Office", "Meeting Room", "Store", "Duct", "ELEC CUPD", "Lift", "WC", "Corridor", "Other"], [1, 6, 2, 1, 1, 1, 1, 2, 2, 3])
    let EFB_F03_A = Area("Area A", ["Office", "Common Room", "Store", "Lift", "WC", "Corridor", "Other"], [12, 1, 1, 1, 2, 2, 3])
    let EFB_F04_A = Area("Area A", ["Office", "Common Room", "Store", "Lift", "WC", "Corridor", "Other"], [12, 1, 1, 1, 2, 3, 3])
    EFB_F01.setAreas([EFB_F01_A])
    EFB_F02.setAreas([EFB_F02_A])
    EFB_F03.setAreas([EFB_F03_A])
    EFB_F04.setAreas([EFB_F04_A])
    
    
    
    // Room
    // 1ST FLOOR
    let F101 = Room("101", false, false, false, false)
    let F102 = Room("102", false, false, false, false)
    let F103 = Room("103", false, false, false, false)
    let F104 = Room("104", false, false, false, false)
    let F105 = Room("105", false, false, false, false)
    let F120 = Room("120", false, false, false, false)
    let F121 = Room("121", false, false, false, false)
    let F180 = Room("180", false, false, false, false)
    let F181 = Room("181", false, false, false, false)
    let F182 = Room("182", false, false, false, false)
    let F183 = Room("183", false, false, false, false)
    let F184 = Room("184", false, false, false, false)
    let F190 = Room("190", false, false, false, false)
    let F192 = Room("192", false, false, false, false)
    let F193 = Room("193", false, false, false, false)
    EFB_F01_A.setRooms([F101, F102, F103, F104, F105, F120, F121, F180, F181, F182, F183, F184, F190,F192, F193])
    
    
    // 2ND FLOOR
    let F201 = Room("201", false, false, false, false)
    let F202 = Room("202", false, false, false, false)
    let F203 = Room("203", false, false, false, false)
    let F204 = Room("204", false, false, false, false)
    let F205 = Room("205", false, false, false, false)
    let F206 = Room("206", false, false, false, false)
    let F207 = Room("207", false, false, false, false)
    let F208 = Room("208", false, false, false, false)
    let F209 = Room("209", false, false, false, false)
    let F209A = Room("209A", false, false, false, false)
    let F210 = Room("210", false, false, false, false)
    let F220 = Room("220", false, false, false, false)
    let F221 = Room("221", false, false, false, false)
    let F280 = Room("280", false, false, false, false)
    let F282 = Room("282", false, false, false, false)
    let F283 = Room("283", false, false, false, false)
    let F284 = Room("284", false, false, false, false)
    let F290 = Room("290", false, false, false, false)
    let F292 = Room("292", false, false, false, false)
    let F293 = Room("293", false, false, false, false)
    EFB_F02_A.setRooms([F201, F202, F203, F204, F205, F206, F207, F208, F209, F209A, F210, F220, F221, F280, F282, F283, F284, F290, F292, F293])
    
    
    // 3RD FLOOR
    let F301 = Room("301", false, false, false, false)
    let F302 = Room("302", false, false, false, false)
    let F303 = Room("303", false, false, false, false)
    let F304 = Room("304", false, false, false, false)
    let F305 = Room("305", false, false, false, false)
    let F306 = Room("306", false, false, false, false)
    let F307 = Room("307", false, false, false, false)
    let F308 = Room("308", false, false, false, false)
    let F309 = Room("309", false, false, false, false)
    let F309A = Room("309A", false, false, false, false)
    let F320 = Room("320", false, false, false, false)
    let F321 = Room("321", false, false, false, false)
    let F380 = Room("380", false, false, false, false)
    let F383 = Room("383", false, false, false, false)
    let F384 = Room("384", false, false, false, false)
    let F390 = Room("390", false, false, false, false)
    let F392 = Room("392", false, false, false, false)
    let F393 = Room("393", false, false, false, false)
    let F394 = Room("394", false, false, false, false)
    EFB_F03_A.setRooms([F301, F302, F303, F304, F305, F306, F307, F308, F309, F309A, F320, F321, F380, F383, F384, F390, F392, F393, F394])
    
    
    // 4TH FLOOR
    let F401 = Room("401", false, false, false, false)
    let F402 = Room("402", false, false, false, false)
    let F403 = Room("403", false, false, false, false)
    let F404 = Room("404", false, false, false, false)
    let F405 = Room("405", false, false, false, false)
    let F406 = Room("406", false, false, false, false)
    let F407 = Room("407", false, false, false, false)
    let F408 = Room("408", false, false, false, false)
    let F408A = Room("408A", false, false, false, false)
    let F409 = Room("409", false, false, false, false)
    let F410 = Room("410", false, false, false, false)
    let F411 = Room("411", false, false, false, false)
    let F412 = Room("412", false, false, false, false)
    let F413 = Room("413", false, false, false, false)
    let F420 = Room("420", false, false, false, false)
    let F421 = Room("421", false, false, false, false)
    let F480 = Room("480", false, false, false, false)
    let F482 = Room("482", false, false, false, false)
    let F483 = Room("483", false, false, false, false)
    let F484 = Room("484", false, false, false, false)
    let F490 = Room("490", false, false, false, false)
    let F492 = Room("492", false, false, false, false)
    let F493 = Room("493", false, false, false, false)
    EFB_F04_A.setRooms([F401, F402, F403, F404, F405, F406, F407, F408, F408A, F409, F410, F411, F412, F413, F420, F421, F480, F482, F483, F484, F490, F492, F493])
    
    
    
    // SFEM initialize
    let Seal = SFEM("Seal", "Chemical Engineering", "abc@ucl.ac.uk", "13-01-2015")
    EFB_F01.addSFEM(Seal)
    
    
    
    // FEM initialize
    let James = FEM("James", "Chemical Engineering","abc@ucl.ac.uk", "13-01-2015")
    EFB_F01_A.addFEM(James)
    
    
    // return the whole initialized engineering front building
    return EngineeringFrontBuilding
}
