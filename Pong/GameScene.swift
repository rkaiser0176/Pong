//
//  GameScene.swift
//  Pong
//
//  Created by Ryan Kaiser on 4/15/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var topPaddle = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = border
        topPaddle = self.childNode(withName: "topPaddle") as! SKSpriteNode
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyA)
        print(contact.bodyB)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
    }
    
}
