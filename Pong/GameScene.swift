//
//  GameScene.swift
//  Pong
//
//  Created by Ryan Kaiser on 4/15/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import SpriteKit
import GameplayKit

let ballCatergory: UInt32 = 1 //0x1 >> 0
let bottomCatergory: UInt32 = 2
let topCatergory: UInt32 = 4
let leftCatergory: UInt32 = 8
let rightCatergory: UInt32 = 16
let paddleCatergory: UInt32 = 32

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var topPaddle = SKSpriteNode()
    var leftPaddle = SKSpriteNode()
    var rightPaddle = SKSpriteNode()
    var bottomPaddle = SKSpriteNode()
    var ball = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        physicsWorld.contactDelegate = self
        
        let bottomLeft = CGPoint(x: frame.origin.x, y: frame.origin.y)
        let bottomRight = CGPoint(x: -frame.origin.x, y: frame.origin.y)
        let topLeft = CGPoint(x: frame.origin.x, y: -frame.origin.y)
        let topRight = CGPoint(x: -frame.origin.x, y: -frame.origin.y)
        
        let bottom = SKNode()
        bottom.name = "bottom"
        bottom.physicsBody = SKPhysicsBody(edgeFrom: bottomLeft, to: bottomRight)
        self.addChild(bottom)
        
        let top = SKNode()
        top.name = "top"
        top.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: topRight)
        self.addChild(top)
        
        let right = SKNode()
        right.name = "right"
        right.physicsBody = SKPhysicsBody(edgeFrom: topRight, to: bottomRight)
        self.addChild(right)
        
        let left = SKNode()
        left.name = "left"
        left.physicsBody = SKPhysicsBody(edgeFrom: topLeft, to: bottomLeft)
        self.addChild(left)
        
        
        topPaddle = self.childNode(withName: "topPaddle") as! SKSpriteNode
        bottomPaddle = self.childNode(withName: "bottomPaddle") as! SKSpriteNode
        rightPaddle = self.childNode(withName: "rightPaddle") as! SKSpriteNode
        leftPaddle = self.childNode(withName: "leftPaddle") as! SKSpriteNode
        
        top.physicsBody?.categoryBitMask = paddleCatergory
        left.physicsBody?.categoryBitMask = paddleCatergory
        right.physicsBody?.categoryBitMask = paddleCatergory
        bottom.physicsBody?.categoryBitMask = paddleCatergory
        
        ball.physicsBody?.categoryBitMask = ballCatergory
        
        bottom.physicsBody?.contactTestBitMask = bottomCatergory
        top.physicsBody?.contactTestBitMask = topCatergory
        right.physicsBody?.contactTestBitMask = rightCatergory
        left.physicsBody?.contactTestBitMask = leftCatergory
        
        ball.physicsBody?.contactTestBitMask = bottomCatergory|rightCatergory|leftCatergory|topCatergory|ballCatergory
        
        
    }
    func didBegin(_ contact: SKPhysicsContact) {
        print(contact.bodyA)
        print(contact.bodyB)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
        leftPaddle.run(SKAction.moveTo(y: location.x, duration: 0.2))
        rightPaddle.run(SKAction.moveTo(y: -location.x, duration: 0.2))
        bottomPaddle.run(SKAction.moveTo(x: -location.x, duration: 0.2))
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        topPaddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
        leftPaddle.run(SKAction.moveTo(y: location.x, duration: 0.2))
        rightPaddle.run(SKAction.moveTo(y: -location.x, duration: 0.2))
        bottomPaddle.run(SKAction.moveTo(x: -location.x, duration: 0.2))
    }
    
}
