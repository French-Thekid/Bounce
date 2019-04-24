//
//  GameScene.swift
//  Bounce
//
//  Created by Darryl Brown on 1/11/18.
//  Copyright © 2018 FrenchCo. All rights reserved.

import SpriteKit
import GameplayKit
import AVFoundation
import PCLBlurEffectAlert

class GameScene: SKScene {
    //declaring regular variables
    
    static var check = false
    static var check2 = true
    static var best = 0
    static var scoreTrack = 0
    
  
    
    //declaring nodes and assigments
    let playbutton = SKSpriteNode(imageNamed:"Play")
    let sun = SKSpriteNode(imageNamed: "Sun")
    let cloud = SKSpriteNode(imageNamed: "Clouds")
    let label = SKSpriteNode(imageNamed: "Label")
    let audio = SKSpriteNode(imageNamed: "Music")
    let audioOff = SKSpriteNode(imageNamed: "MusicOff")
    let sound1 = SKSpriteNode(imageNamed: "Audio")
    let soundOff = SKSpriteNode(imageNamed: "AudioOff")
    let setting = SKSpriteNode(imageNamed: "Settings")
    let how = SKSpriteNode(imageNamed: "How")
    
    let scoreText = SKLabelNode(fontNamed: "Chalkduster")
    var Score = SKLabelNode(fontNamed: "Chalkduster")
    
    static var c = false
    
    
    override func didMove(to view: SKView) {
        
       
        // copy this syntax, it tells the compiler what to do when action is received
      
        
        self.Score.text = String(PlayScene.scorekeep)
        
        //setting positions of nodes
        self.audio.name = "Audio"
        self.audioOff.name = "AudioOff"
        self.sound1.name = "sound"
        self.soundOff.name = "soundOff"

        self.playbutton.position = CGPoint(x: self.frame.midX, y: self.frame.height*(-0.09))
        self.sun.position = CGPoint(x: self.frame.width*0.35, y: self.frame.height*0.4)
        self.cloud.position = CGPoint(x: self.frame.midX, y: self.frame.height*0.34)
        self.label.position = CGPoint(x: self.frame.midX, y: self.frame.height*0.09)
        self.audio.position = CGPoint(x: self.frame.width*(-0.39), y: self.frame.height*(-0.44))
        self.audioOff.position = CGPoint(x: self.frame.width*(-0.39), y: self.frame.height*(-0.44))
        self.sound1.position = CGPoint(x: self.frame.width*(-0.21), y: self.frame.height*(-0.44))
        self.soundOff.position = CGPoint(x: self.frame.width*(-0.21), y: self.frame.height*(-0.44))
        self.setting.position = CGPoint(x: self.frame.width*(0.39), y: self.frame.height*(-0.44))
        self.how.position = CGPoint(x: self.frame.width*(0.21), y: self.frame.height*(-0.44))
        
        self.scoreText.text = "Best Score:"
        self.scoreText.fontSize = 50
        self.scoreText.position = CGPoint(x: self.frame.midX - 60 , y: self.frame.height*(-0.22))
        
        self.Score.text = "0"
        self.Score.fontSize = 56
        self.Score.position = CGPoint(x: self.frame.midX + 140 , y: self.frame.height*(-0.227))
       
        let defaults = UserDefaults.standard
        let token = defaults.string(forKey: "HighScore")
        GameScene.scoreTrack = defaults.integer(forKey: "HighScore")
        self.Score.text = token //String(PlayScene.scorekeep)
        GameScene.best = Int(token!)!
        //placing nodes on current screen
        self.addChild(self.playbutton)
        self.addChild(self.sun)
        self.addChild(self.label)
        self.addChild(self.audio)
        self.addChild(self.cloud)
        self.addChild(self.sound1)
        self.addChild(self.scoreText)
        self.addChild(self.Score)
        self.addChild(self.setting)
        self.addChild(self.how)

        //background color
        self.backgroundColor = UIColor(hex: 0x80D9FF)
        
        if (GameScene.check2 == true)
        {
            GameViewController.audioPlayer.play()
        }
        else{
            self.childNode(withName: "Audio")?.removeFromParent()
            self.addChild(self.audioOff)
        }
        if (GameScene.check == true)
        {
            self.childNode(withName: "sound")?.removeFromParent()
            self.addChild(self.soundOff)
        }


    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        for touch: AnyObject in touches
        {
            let location = touch.location(in: self)
            if self.atPoint(location) == self.playbutton
            {
                if (GameScene.check == false )
                {
                    GameViewController.audioPlayerT.play()
                }
                //time delay
                sleep(1 / 2)
                
                let scene = PlayScene(size: self.size)
                let skView = self.view as! SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
                
 
            }
            if self.atPoint(location) == self.setting
            {
                if (GameScene.check == false )
                {
                    GameViewController.audioPlayerT.play()
                }
                //time delay
                sleep(1 / 2)
                
   
                let scene1 = Setting(size: self.size)
                let skView1 = self.view as! SKView
                skView1.ignoresSiblingOrder = true
                scene1.scaleMode = .resizeFill
                scene1.size = skView1.bounds.size
                skView1.presentScene(scene1)
                   
            }
            
            if self.atPoint(location) == self.how
            {
                if (GameScene.check == false )
                {
                    GameViewController.audioPlayerT.play()
                }
                //time delay
                sleep(1 / 2)
                
                
                let scene = How(size: self.size)
                let skView = self.view as! SKView
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .resizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
                
            }
            
            //Toggling Volume and audio on and Off
            if self.atPoint(location) == self.audio
            {
                self.childNode(withName: "Audio")?.removeFromParent()
                self.addChild(self.audioOff)

                /*  Volumn off code here nigga */
                GameViewController.audioPlayer.pause()
                GameScene.check2 = false


            }else if self.atPoint(location) == self.audioOff
            {
                self.childNode(withName: "AudioOff")?.removeFromParent()
                self.addChild(self.audio)

                /* Volume On code here bruh */
                GameViewController.audioPlayer.play()
                GameScene.check2 = true
                
            }

            if self.atPoint(location) == self.sound1
            {
                self.childNode(withName: "sound")?.removeFromParent()
                self.addChild(self.soundOff)

                /*  Volumn off code here nigga */
                GameViewController.audioPlayerT.pause()
                GameScene.check = true


            }else if self.atPoint(location) == self.soundOff
            {
                self.childNode(withName: "soundOff")?.removeFromParent()
                self.addChild(self.sound1)
                GameScene.check = false

                /* Volume On code here bruh */
            }

        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
