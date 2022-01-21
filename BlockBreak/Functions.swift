//
//  Functions.swift
//  BlockBreak
//
//  Created by DK on 2022/01/17.
//

import Foundation
import SpriteKit

extension GameScene {
    
    func setting(){
        let stage = Stages()
//        tiliting()
    }
    
    
    //첨 터치 했을 때
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)
            if Variables.isplayed {
            Variables.paddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }else{
                Variables.paddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                Variables.ball.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    
    //터치 후 움직였을 때
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if Variables.isplayed {
            Variables.paddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }else{
                Variables.paddle.run(SKAction.moveTo(x: location.x, duration: 0.2))
                Variables.ball.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }//드래그
        }
    }
    
    //터치가 종료되었을 때
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node : SKNode = self.atPoint(location)
            if node.name == "paddle"{
                if !Variables.isplayed {
                    Variables.isplayed = true
                    Variables.ball.physicsBody?.isDynamic = true
                    Variables.ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
                }
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        <#code#>
    }
    
    //기울기로 패들 움직이기
    func tiliting(){
        motion.accelerometerUpdateInterval = 0.1
        motion.startAccelerometerUpdates(to: .main) { (data, error) in
            let value = data!.acceleration.y * 1000
            print("data\(value)")
            Variables.paddle.run(SKAction.moveTo(x: value, duration: 0.2))
        }
    }
}
//90zxvzxv
