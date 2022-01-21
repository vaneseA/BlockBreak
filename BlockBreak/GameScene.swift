//
//  GameScene.swift
//  BlockBreak
//
//  Created by DK on 2022/01/16.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene, SKPhysicsContactDelegate {

    let motion = CMMotionManager()
    
    override func didMove(to view: SKView) {
        Variables.scene = self
        self.physicsWorld.contactDelegate = self
        setting()
      
    }

}
