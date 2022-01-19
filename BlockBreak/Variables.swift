//
//  Variables.swift
//  BlockBreak
//
//  Created by DK on 2022/01/17.
//

import Foundation
import SpriteKit

struct Variables {
    static var scene = SKScene()
    static var paddle = SKSpriteNode()
    static var ball = SKShapeNode(circleOfRadius: 10)
    
    static let ballCategory : UInt32 = 0x1 << 0     //0000001
    static let paddleCategory : UInt32 = 0x1 << 1   //000010
    static let bottomCategory : UInt32 = 0x1 << 2   //000100
    static let blockCategory : UInt32 = 0x1 << 3    //001000
    
    static var blockNum = 0
    static var isplayed = false
    
}
//sdfdsf
