//
//  Setting.swift
//  Bounce
//
//  Created by Darryl Brown on 1/16/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import Foundation
import PCLBlurEffectAlert

class Setting: SKScene
{
    let Ball1 = SKSpriteNode(imageNamed: "Ball1")
    let Ball3 = SKSpriteNode(imageNamed: "Ball3")
    let Ball4 = SKSpriteNode(imageNamed: "Ball4")
    let Ball5 = SKSpriteNode(imageNamed: "Ball5")
    let Ball6 = SKSpriteNode(imageNamed: "Ball6")
    let Ball7 = SKSpriteNode(imageNamed: "Ball7")
    let temp = SKSpriteNode(imageNamed: "temp")
    let back = SKSpriteNode(imageNamed: "Done")
    var check = false;
    
    let label = SKSpriteNode(imageNamed: "CBall")
    
    var stat = false;
    var stat1 = false;
    var stat2 = false;
    var stat3 = false;
    var stat4 = false;
    var stat5 = false;
    var groundSpeed = 5
    
    static var Option = "Ball2"
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.cyan
        
        self.temp.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 100)
        self.back.position = CGPoint(x: self.frame.midX, y: self.frame.minY + 50 )
        self.back.name = "Back"
        
        self.label.position = CGPoint(x: self.frame.midX , y: self.frame.maxY - 50)
        
        self.Ball1.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY - 160)
        
        self.Ball3.position = CGPoint(x: self.frame.minX + 220, y: self.frame.maxY - 160)
        self.Ball4.position = CGPoint(x: self.frame.minX + 350, y: self.frame.maxY - 160)
        self.Ball5.position = CGPoint(x: self.frame.minX + 70, y: self.frame.maxY - 260)
        self.Ball6.position = CGPoint(x: self.frame.minX + 220, y: self.frame.maxY - 260)
        self.Ball7.position = CGPoint(x: self.frame.minX + 350, y: self.frame.maxY - 260)
        
        self.addChild(self.temp)
        self.addChild(self.back)
        self.addChild(self.label)
        self.addChild(self.Ball1)
        self.addChild(self.Ball3)
        self.addChild(self.Ball4)
        self.addChild(self.Ball5)
        self.addChild(self.Ball6)
        self.addChild(self.Ball7)
        
        
        
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
            if self.atPoint(location) == self.Ball1
            {
                stat = true
                stat1 = false
                stat2 = false
                stat3 = false
                stat4 = false
                stat5 = false
                Setting.Option = "Ball1"
                
            }
            if self.atPoint(location) == self.Ball3
            {
                stat1 = true
                stat = false
                stat2 = false
                stat3 = false
                stat4 = false
                stat5 = false
                Setting.Option = "Ball2"
                
            }
            if self.atPoint(location) == self.Ball4
            {
                stat2 = true
                stat1 = false
                stat = false
                stat3 = false
                stat4 = false
                stat5 = false
                Setting.Option = "Ball3"
            }
            if self.atPoint(location) == self.Ball5
            {
                stat3 = true
                stat1 = false
                stat2 = false
                stat = false
                stat4 = false
                stat5 = false
                Setting.Option = "Ball4"
            }
            if self.atPoint(location) == self.Ball6
            {
                stat4 = true
                stat1 = false
                stat2 = false
                stat3 = false
                stat = false
                stat5 = false
                Setting.Option = "Ball5"
            }
            if self.atPoint(location) == self.Ball7
            {
                stat5 = true
                stat1 = false
                stat2 = false
                stat3 = false
                stat4 = false
                stat = false
                Setting.Option = "Ball6"
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        let degreeRotation = CDouble(self.groundSpeed)*Double.pi / 180
        if( self.stat == true)
        {
          self.Ball1.zRotation -= CGFloat(degreeRotation)
        }
        if( self.stat1 == true)
        {
            self.Ball3.zRotation -= CGFloat(degreeRotation)
        }
        if( self.stat2 == true)
        {
            self.Ball4.zRotation -= CGFloat(degreeRotation)
        }
        if( self.stat3 == true)
        {
            self.Ball5.zRotation -= CGFloat(degreeRotation)
        }
        if( self.stat4 == true)
        {
            self.Ball6.zRotation -= CGFloat(degreeRotation)
        }
        if( self.stat5 == true)
        {
            self.Ball7.zRotation -= CGFloat(degreeRotation)
        }
    }
    
   
    
}
