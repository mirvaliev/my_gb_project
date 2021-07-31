//
//  EngeBody.swift
//  mySnake
//
//  Created by Sagit Mirvaliev on 31/07/21.
//

import UIKit
import SpriteKit
import Foundation
import GameplayKit

class EngeBody: SKShapeNode {
    init (position: CGPoint) {
        super.init()
        path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 12, height: 50)).cgPath
        fillColor = UIColor.white
        strokeColor = UIColor.white
        lineWidth = 2
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: 3.0, center: CGPoint(x: 5, y: 5))
        self.physicsBody?.categoryBitMask = ColisionCategory.EngeBody
        self.physicsBody?.contactTestBitMask = ColisionCategory.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
