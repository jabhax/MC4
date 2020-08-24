//
//  Chips.swift
//  MC4
//
//  Created by Justin Barros on 7/31/20.
//  Copyright © 2020 JabKamHax. All rights reserved.
//

import Foundation
import SpriteKit



class Chips {
    var chips: [SKShapeNode] = [SKShapeNode]()
    
    init() {
    }

    func drawChip(location: CGPoint) {
        let chip = SKShapeNode(circleOfRadius: 50) // Size of Circle
        chip.position = location
        chip.strokeColor = SKColor.black
        chip.glowWidth = 1.0
        chip.fillColor = SKColor.orange
        self.chips.append(chip)
        print("Created Chip at \(location)")
    }
    
    func getChips() -> [SKShapeNode] {
        return self.chips
    }
}
