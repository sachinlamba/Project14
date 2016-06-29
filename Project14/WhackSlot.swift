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
    var charNode: SKSpriteNode!
    var visible = false
    var isHit = false
    
    func configureAtPosition(pos: CGPoint) {
        position = pos
        
        let sprite = SKSpriteNode(imageNamed: "whackHole")
        addChild(sprite)
        
        let cropNode = SKCropNode()
        cropNode.position = CGPoint(x: 0, y: 15)
        cropNode.zPosition = 1
        cropNode.maskNode = SKSpriteNode(imageNamed: "whackMask")
        
        charNode = SKSpriteNode(imageNamed: "penguinGood")
        charNode.position = CGPoint(x: 0, y: -90)
        charNode.name = "character"
        cropNode.addChild(charNode)
        
        addChild(cropNode)
        
    }
    
    func show( hideTime hideTime: Double) {
        if visible { return }
        
        charNode.xScale = 1
        charNode.yScale = 1
        
        charNode.runAction(SKAction.moveByX(0, y: 80, duration: 0.05))
        visible = true
        isHit = false
        
        if RandomInt(min: 0, max: 2) == 0 {
            charNode.texture = SKTexture(imageNamed: "PenguinGood")
            charNode.name = "charFriend"
        } else {
            charNode.texture = SKTexture(imageNamed: "PenguinEvil")
            charNode.name = "charEnemy"
        }
        
        RunAfterDelay(hideTime * 3.5) { [unowned self] in
            self.hide()
        }
    }
    
    func hide() {
        if !visible { return }
        
        charNode.runAction(SKAction.moveByX(0, y:-80, duration:0.05))
        visible = false
    }
    
    func hit() {
        isHit = true
        
        let delay = SKAction.waitForDuration(0.25)
        let hide = SKAction.moveByX(0, y:-80, duration:0.5)
        let notVisible = SKAction.runBlock { [unowned self] in self.visible = false }
        charNode.runAction(SKAction.sequence([delay, hide, notVisible]))
    }
    
    
}
