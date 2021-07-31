//
//  Snake.swift
//  mySnake
//
//  Created by Sagit Mirvaliev on 31/07/21.
//

import UIKit
import SpriteKit
import Foundation
import GameplayKit

class SnakeBodyPart: SKShapeNode {
    let diametr = 5
    init (atPoint point: CGPoint){
        super.init()
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        fillColor = UIColor.green
        strokeColor = UIColor.green
        lineWidth = 5
        self.position = point
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diametr - 4), center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = ColisionCategory.Snake
        self.physicsBody?.contactTestBitMask = ColisionCategory.EngeBody | ColisionCategory.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnakeBodyHand: SnakeBodyPart {
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        self.physicsBody?.categoryBitMask = ColisionCategory.SnakeHead
        self.physicsBody?.contactTestBitMask = ColisionCategory.EngeBody | ColisionCategory.Apple | ColisionCategory.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class Snake: SKShapeNode {
    var body = [SnakeBodyPart]()
    let moveSped: CGFloat = 120.0
    var angle: CGFloat = 0.0
    
    init (atPoint point: CGPoint) {
        super.init()
        let head = SnakeBodyHand(atPoint: point)
        body.append(head)
        addChild(head)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBodyPart() {
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    func moveSnake () {
        guard !body.isEmpty else { return }
        let headSnake = body[0]
        moveHeadSnake(head: headSnake)
        
        for i in 0 ..< body.count where i > 0 {
            let previusBodyPart = body[i - 1]
            let corrrentBodyPart = body[i]
            moveBodyPart(p: previusBodyPart, c: corrrentBodyPart)
        }
    }
    
    func moveHeadSnake (head: SnakeBodyPart) {
        let dx = moveSped * sin(angle)
        let dy = moveSped * cos(angle)
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        head.run(moveAction)
    }
    
    func moveBodyPart (p: SnakeBodyPart, c: SnakeBodyPart) {
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        c.run(moveAction)
    }
    
    func moveClockWise () {
        angle += CGFloat(Double.pi / 2)
    }
    
    func moveCounterClockWise() {
        angle -= CGFloat(Double.pi / 2)
    }
}
