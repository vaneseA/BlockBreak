//
//  Stages.swift
//  BlockBreak
//
//  Created by DK on 2022/01/17.
//

import Foundation
import SpriteKit

class Stages {
    
    let view = Variables.scene.view!
    
    init() {
        Variables.scene.physicsWorld.speed = 0.5//공속도 조절
        bg()
        paddleImage()
        ballImage()
        border()
        blocks()
    }

    func bg(){
        let bg = SKSpriteNode()
        bg.texture = SKTexture(imageNamed:  "bg1")
        bg.size = view.frame.size
        bg.position = CGPoint(x: 0, y: 0)
        bg.zPosition = -1
        Variables.scene.addChild(bg)
    }
    
    func paddleImage(){
        Variables.paddle.size = CGSize(width: 200, height: 60)
        Variables.paddle.position = CGPoint(x: 0, y: -view.frame.height / 2 + 30)
        Variables.paddle.texture = SKTexture(imageNamed: "bar")
        Variables.paddle.zPosition = 2
        Variables.paddle.name = "paddle"
        Variables.scene.addChild(Variables.paddle)
        Variables.paddle.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 200, height: 45))
        Variables.paddle.physicsBody?.isDynamic = false
        Variables.paddle.physicsBody?.allowsRotation = false
        Variables.paddle.physicsBody?.affectedByGravity = false
        Variables.paddle.physicsBody?.friction = 0
        Variables.paddle.physicsBody?.restitution = 0
        Variables.paddle.physicsBody?.categoryBitMask = Variables.paddleCategory
        Variables.paddle.physicsBody?.contactTestBitMask = Variables.ballCategory
    }
    func ballImage() {
        Variables.ball.fillColor = .cyan
        Variables.ball.strokeColor = .green
        Variables.ball.glowWidth = 3 //빛나는 효과
        Variables.ball.blendMode = .screen
        Variables.ball.position = CGPoint(x: Variables.paddle.position.x, y: Variables.paddle.position.y + 30)
        Variables.ball.name = "ball"
        Variables.scene.addChild(Variables.ball)
        Variables.ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        Variables.ball.physicsBody?.isDynamic = false
        Variables.ball.physicsBody?.affectedByGravity = false
        Variables.ball.physicsBody?.friction = 0
        Variables.ball.physicsBody?.restitution = 1
        Variables.ball.physicsBody?.categoryBitMask = Variables.ballCategory
        //Variables.ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))//삭제
        Variables.ball.physicsBody?.linearDamping = 0 //공 속도 줄어드니까 이걸로 해결
    }
    //핸드폰 경계
    func border(){
        let border = SKPhysicsBody(edgeLoopFrom: Variables.scene.frame)
        border.friction = 0
        border.restitution = 1
        Variables.scene.physicsBody = border
    }
    
    func blocks(){
        let col = 10
        let row = 3
        let gab = 30
        let block_w = Int(view.frame.width) / col
        let block_h = Int(block_w / 2) + gab
        let startX = Int(-view.frame.width / 2) + (block_w + gab)
        let startY = Int(view.frame.height / 2) - (block_h / 2)
        
        for i in 0..<col {
            for j in 0..<row {
                let block = SKSpriteNode()
                block.size = CGSize(width: block_w, height: block_h)
                let xValue = (block_w - gab / 2) * i
                let yValue = (block_h - gab) * j
                block.position = CGPoint(x: startX + xValue, y: startY - yValue)
                let num = Int.random(in: 1...10)
                block.texture = SKTexture(imageNamed:  "block\(num)")
                block.zPosition = 1
                block.name = "block\(num)"
                Variables.scene.addChild(block)
                Variables.blockNum += 1
                block.physicsBody = SKPhysicsBody(rectangleOf:  CGSize(width: block_w, height: block_h - (gab / 2)))
                block.physicsBody?.isDynamic = false
                block.physicsBody?.affectedByGravity = false
                block.physicsBody?.allowsRotation = false
                block.physicsBody?.categoryBitMask = Variables.blockCategory
                block.physicsBody?.contactTestBitMask = Variables.ballCategory
            }
        }
    }
}
