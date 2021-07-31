//
//  Apple.swift
//  mySnake
//
//  Created by Sagit Mirvaliev on 30/07/21.
//

import UIKit
import SpriteKit
import Foundation
import GameplayKit

class Apple: SKShapeNode {
    init (position: CGPoint) {
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 5, height: 5)).cgPath // отрисовка и размер яблока
        fillColor = UIColor.red
        strokeColor = UIColor.red
        lineWidth = 5
        self.position = position
        self.physicsBody = SKPhysicsBody(circleOfRadius: 3.0, center: CGPoint(x: 5, y: 5))
        self.physicsBody?.categoryBitMask = ColisionCategory.Apple
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
