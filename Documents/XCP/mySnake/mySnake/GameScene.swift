//
//  GameScene.swift
//  mySnake
//
//  Created by Sagit Mirvaliev on 30/07/21.
//

import SpriteKit
import GameplayKit

struct ColisionCategory {
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EngeBody: UInt32 = 0x1 << 3
    
}

class GameScene: SKScene {
  
    var snake: Snake?

    override func didMove(to view: SKView) {
        
        // Метод для описания всех всех объектов формы
                
        backgroundColor = SKColor.blue // цвет фона экрана
        physicsWorld.gravity = CGVector(dx: 0, dy: 0) // гравитация
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame) // физика тел по всему экрану
        physicsBody?.allowsRotation = false // отключение поворота экрана
        view.showsPhysics = true // отображение всего
        
        // создача кнопок
        let counterClockLeft = SKShapeNode()
        counterClockLeft.name = "counterClockLeft" // имя кнопки для поиска
        counterClockLeft.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 30, height: 30)).cgPath
        counterClockLeft.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30) // позиция кнопки н экране
        counterClockLeft.fillColor = UIColor.magenta // заливка кнопки
        counterClockLeft.strokeColor = UIColor.magenta // цвет рамки
        counterClockLeft.lineWidth = 10 // размер рамки
        self.addChild(counterClockLeft) // добавляем элемент н сцену
        self.physicsBody?.isDynamic = false
        
        let counterClockRight = SKShapeNode()
        counterClockRight.name = "counterClockRight" // имя кнопки для поиска
        counterClockRight.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 30, height: 30)).cgPath
        counterClockRight.position = CGPoint(x: view.scene!.frame.maxX - 55, y: view.scene!.frame.minY + 30)
        counterClockRight.fillColor = UIColor.magenta // заливка кнопки
        counterClockRight.strokeColor = UIColor.magenta // цвет рамки
        counterClockRight.lineWidth = 10 // размер рамки
        self.addChild(counterClockRight) // добавляем элемент н сцену
        self.physicsBody?.isDynamic = false
        
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
        self.physicsWorld.contactDelegate = self
        self.physicsBody?.categoryBitMask = ColisionCategory.EngeBody
        self.physicsBody?.collisionBitMask = ColisionCategory.Snake | ColisionCategory.SnakeHead
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Метод для описания действий по нажатию на объект
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockLeft" || touchesNode.name == "counterClockRight" else { return }
            touchesNode.fillColor = UIColor.white
            
            if touchesNode.name == "counterClockRight" {
                snake!.moveCounterClockWise()
            } else if touchesNode.name == "counterClockLeft" {
                snake!.moveClockWise()
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // Метод для описания действий после нажатия на объект
        
        for touch in touches {
            let touchLocation = touch.location(in: self)
            guard let touchesNode = self.atPoint(touchLocation) as? SKShapeNode, touchesNode.name == "counterClockLeft" || touchesNode.name == "counterClockRight" else { return }
            touchesNode.fillColor = UIColor.magenta
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    func createApple () {
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)))
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)))
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.moveSnake()
    }
    
    func restartGame () {
        let gameScene: GameScene = GameScene(size: self.view!.bounds.size)
        let transition = SKTransition.fade(withDuration: 1.0)
        gameScene.scaleMode = SKSceneScaleMode.fill
        self.view!.presentScene(gameScene, transition: transition)
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        let colisionsObject = bodes - ColisionCategory.SnakeHead
        switch colisionsObject {
            case ColisionCategory.Apple:
                let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
                snake!.addBodyPart()
                apple?.removeFromParent()
                createApple()
            case ColisionCategory.EngeBody:
                snake!.removeFromParent()
                self.removeAllChildren()
                self.removeAllActions()
                self.scene?.removeFromParent()
                self.isPaused = true
                restartGame()
            default: break
        }
    }
}
