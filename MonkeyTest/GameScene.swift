//
//  GameScene.swift
//  MonkeyTest
//
//  Created by Jason Fry on 06/12/2018.
//  Copyright © 2018 Jason Fry. All rights reserved.
//

import SpriteKit
import GameplayKit


class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0

    let ball = SKSpriteNode(imageNamed: "green")

    
    override func didMove(to view: SKView)
    {

        self.addChild(ball)
        
        doStuff();
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode?
//        {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        doStuff()
    }
    
    func doStuff()
    {
        var actions = Array<SKAction>();
        actions.append(SKAction.move(to: CGPoint(x:300,y:300), duration: 1));
        actions.append(SKAction.rotate(byAngle: 6.28, duration: 1));
        actions.append(SKAction.colorize(with: .red, colorBlendFactor: 1.0, duration: 1));
        let sequence = SKAction.sequence(actions);
        ball.run(sequence);
    }
}
