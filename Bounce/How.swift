//
//  How.swift
//  Bounce
//
//  Created by Darryl Brown on 1/25/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import Foundation

class How: SKScene
{
    let back = SKSpriteNode(imageNamed: "Done")
    let how = SKSpriteNode(imageNamed: "How1")
    let BL = SKSpriteNode(imageNamed: "BonusLogo")
    let B1 = SKSpriteNode(imageNamed: "bo1")
    let B2 = SKSpriteNode(imageNamed: "bo2")
    let B3 = SKSpriteNode(imageNamed: "bo3")
    
    let intro = SKLabelNode(fontNamed: "Chalkduster")
    let intro1 = SKLabelNode(fontNamed: "Chalkduster")
    let intro2 = SKLabelNode(fontNamed: "Chalkduster")
    let intro3 = SKLabelNode(fontNamed: "Chalkduster")
    let intro4 = SKLabelNode(fontNamed: "Chalkduster")
    let intro5 = SKLabelNode(fontNamed: "Chalkduster")
    let Speed = SKLabelNode(fontNamed: "Chalkduster")
    let Speed2 = SKLabelNode(fontNamed: "Chalkduster")
    let Invincible = SKLabelNode(fontNamed: "Chalkduster")
    let Invincible2 = SKLabelNode(fontNamed: "Chalkduster")
    let Gravity = SKLabelNode(fontNamed: "Chalkduster")
    let Gravity2 = SKLabelNode(fontNamed: "Chalkduster")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(hex: 0x80D9FF)
        
        self.intro.text = "Bounce is a fun interactive challenging game";
        self.intro1.text = "in which you have to use a ball to bounce";
        self.intro2.text = "over incomming obstacles which comes in at";
        self.intro3.text = "random intervals. The difficulty increases";
        self.intro4.text = "with your score. The harder you touch the ";
        self.intro5.text = "further you bounce.";
        
        self.intro.fontSize = 15
        self.intro.position = CGPoint(x: self.frame.minX + 207, y: self.frame.maxY - 140 )
        self.intro1.fontSize = 15
        self.intro1.position = CGPoint(x: self.frame.minX + 196, y: self.frame.maxY - 170 )
        self.intro2.fontSize = 15
        self.intro2.position = CGPoint(x: self.frame.minX + 205, y: self.frame.maxY - 200 )
        self.intro3.fontSize = 15
        self.intro3.position = CGPoint(x: self.frame.minX + 196, y: self.frame.maxY - 230 )
        self.intro4.fontSize = 15
        self.intro4.position = CGPoint(x: self.frame.minX + 196, y: self.frame.maxY - 260 )
        self.intro5.fontSize = 15
        self.intro5.position = CGPoint(x: self.frame.minX + 100, y: self.frame.maxY - 290 )
        
        self.Speed.text = "This Bonus Slows down the speed of";
        self.Speed2.text = "the game for a short period.";
        self.Speed.fontSize = 15
        self.Speed.position = CGPoint(x: self.frame.minX + 245, y: self.frame.minY + 300 )
        self.Speed2.fontSize = 15
        self.Speed2.position = CGPoint(x: self.frame.minX + 250, y: self.frame.minY + 270 )
        
        self.Invincible.text = "This Bonus makes your ball invincible";
        self.Invincible2.text = "for a short period of the game.";
        self.Invincible.fontSize = 15
        self.Invincible.position = CGPoint(x: self.frame.minX + 248, y: self.frame.minY + 220 )
        self.Invincible2.fontSize = 15
        self.Invincible2.position = CGPoint(x: self.frame.minX + 250, y: self.frame.minY + 190 )
        
        self.Gravity.text = "This Bonus increase the gravity on the";
        self.Gravity2.text = "ball for a short period of the game.";
        self.Gravity.fontSize = 15
        self.Gravity.position = CGPoint(x: self.frame.minX + 250, y: self.frame.minY + 140 )
        self.Gravity2.fontSize = 15
        self.Gravity2.position = CGPoint(x: self.frame.minX + 250, y: self.frame.minY + 120 )
        
        self.back.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50 )
        self.how.position = CGPoint(x: self.frame.minX + 200, y: self.frame.maxY - 60 )
        self.BL.position = CGPoint(x: self.frame.minX + 200, y: self.frame.minY + 380 )
        
        self.B1.position = CGPoint(x: self.frame.minX + 40, y: self.frame.minY + 300 )
        self.B2.position = CGPoint(x: self.frame.minX + 40, y: self.frame.minY + 220 )
        self.B3.position = CGPoint(x: self.frame.minX + 40, y: self.frame.minY + 140 )
        self.back.name = "Back"
        
        
        self.addChild(self.back)
        self.addChild(self.how)
        self.addChild(self.BL)
        self.addChild(self.B1)
        self.addChild(self.B2)
        self.addChild(self.B3)
        self.addChild(self.Speed)
        self.addChild(self.Speed2)
        self.addChild(self.Invincible)
        self.addChild(self.Invincible2)
        self.addChild(self.Gravity)
        self.addChild(self.Gravity2)
        self.addChild(self.intro)
        self.addChild(self.intro1)
        self.addChild(self.intro2)
        self.addChild(self.intro3)
        self.addChild(self.intro4)
        self.addChild(self.intro5)

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches
        {
            let location = touch.location(in: self)
            if (self.atPoint(location) == self.back )
            {
                if (GameScene.check == false )
                {
                    GameViewController.audioPlayerT.play()
                }
                //time delay
                sleep(1)
                if let scene = GKScene(fileNamed: "GameScene") {
                    
                    // Get the SKScene from the loaded GKScene
                    if let sceneNode = scene.rootNode as! GameScene? {
                        
                        // Set the scale mode to scale to fit the window
                        sceneNode.scaleMode = .aspectFill
                        
                        
                        // Present the scene
                        if let skview = self.view as! SKView? {
                            //  audioPlayer.play()
                            
                            skview.presentScene(sceneNode)
                            
                            skview.ignoresSiblingOrder = true
                            
                            
                            skview.showsFPS = false
                            skview.showsNodeCount = false
                        }
                    }
                }
            }
        }
    }
}
