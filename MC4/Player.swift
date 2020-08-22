//
//  Player.swift
//  MC4
//
//  Created by Justin Barros on 7/31/20.
//  Copyright © 2020 JabKamHax. All rights reserved.
//

import Foundation
import SpriteKit

class Player {
    // Player Class
    private static var ID: Int = 0
    var PID: Int
    
    init() {
        Player.ID += 1
        self.PID = Player.ID
    }
    
    var description: String {
        return "Player ID: \(self.PID)"
    }
}
