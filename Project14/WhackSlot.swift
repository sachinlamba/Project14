//
//  WhackSlot.swift
//  Project14
//
//  Created by Sachin Lamba on 29/06/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit
import SpriteKit

class WhackSlot: SKNode {
    func configureAtPosition(pos: CGPoint) {
        position = pos
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
    }
}
