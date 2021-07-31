//
//  GameViewController.swift
//  mySnake
//
//  Created by Sagit Mirvaliev on 30/07/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mySnakeScene = GameScene(size: view.bounds.size) // Экземпляр класса сцена
        let skView = view as! SKView // Вид экрана
        
        // Оформляем вид экрана
        skView.showsFPS = true // отображение количества кадров с секунду
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true // рандомная прорисовка сцены
        mySnakeScene.scaleMode = .resizeFill // покрытие сценны на весь экран
        
        skView.presentScene(mySnakeScene)
        
    }
}
