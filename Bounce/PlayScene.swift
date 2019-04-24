//
//  PlayScene.swift
//  Bounce
//
//  Created by Darryl Brown on 1/14/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation
import PCLBlurEffectAlert

class PlayScene: SKScene, SKPhysicsContactDelegate
{
    var vc = GameViewController()
  
    
    
    let movingFloor = SKSpriteNode(imageNamed: "Bar")
    let ball = SKSpriteNode(imageNamed: "Ball")
    let ball1 = SKSpriteNode(imageNamed: "B1")
    let ball2 = SKSpriteNode(imageNamed: "Ball3")
    let ball3 = SKSpriteNode(imageNamed: "B3")
    let ball4 = SKSpriteNode(imageNamed: "B4")
    let ball5 = SKSpriteNode(imageNamed: "B5")
    let ball6 = SKSpriteNode(imageNamed: "B6")
    
    
    //Implement later bruh!!!
    let Invincible =  SKSpriteNode(imageNamed: "Shield")
   // let DoubleJump = SKSpriteNode(imageNamed: "")
    let Speed = SKSpriteNode(imageNamed: "Speed")
    let IncreasedGrav = SKSpriteNode(imageNamed: "Gravity")
    let clock = SKSpriteNode(imageNamed: "Clock")
    let clock1 = SKSpriteNode(imageNamed: "Clock1")
    let clock2 = SKSpriteNode(imageNamed: "Clock2")
    var range = UInt32(50)..<UInt32(400)//frames
    
    let Pot1 = SKSpriteNode(imageNamed: "Pot1")
    let Pot2 = SKSpriteNode(imageNamed: "Pot2")
    let scoreText = SKLabelNode(fontNamed: "Chalkduster")
    let Home = SKSpriteNode(imageNamed: "Home")
    let Pause = SKSpriteNode(imageNamed: "Pause")
    let resume = SKSpriteNode(imageNamed: "Play2")

    
   
    
    var origMovingFloorPos = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 5
    var heroBaseLine = CGFloat(0)
    var onGround = true
    var velocityY = CGFloat(0)
    var gravity = CGFloat(0.38) //this determines how far the ball jump
    var status = true
    var fail = AVAudioPlayer()
    var begin = AVAudioPlayer()
    var bonuss = AVAudioPlayer()
    var bonus1 = AVAudioPlayer()
    var tracker = 6
    var Grav = true
    var crash = false
    var crash2 = false
    var crash3 = false
    var crash4 = false
    var key = false
    
    var origPotPosX = CGFloat(0)
    var origInvinPosX = CGFloat(0)
    var origGravPosX = CGFloat(0)
    var potMaxX = CGFloat(0)
    var bonusMaxX = CGFloat(0)
    var origBonusPosX = CGFloat(0)
    var score = 0
    static var scorekeep = 0
    
    enum CollideType:UInt32
    {
        case Ball = 1
        case Pots = 2
        case Speed = 3
        case Invincibility = 4
        case Gravity = 5
    }
    
    //pop up stuff
    
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor( hex: 0x80D9FF)
       
        
        self.physicsWorld.contactDelegate = self
        
        self.movingFloor.anchorPoint = CGPoint(x: 0, y: 0.5)
        self.movingFloor.position = CGPoint(x: self.frame.minX , y: self.frame.minY - 30)
        
        self.origMovingFloorPos = self.movingFloor.position.x
        self.maxBarX = self.movingFloor.size.width - self.frame.size.width
        self.maxBarX *= -1
        
        self.heroBaseLine = self.frame.minY + 109
        
        //Ball Physics for all variety
        self.ball.position = CGPoint(x: self.frame.minX + 80, y: (self.frame.minY + 109))
        self.ball.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball.size.width / 3))
        self.ball.physicsBody!.affectedByGravity = false
        self.ball.physicsBody!.categoryBitMask = CollideType.Ball.rawValue
        self.ball.physicsBody!.contactTestBitMask = CollideType.Pots.rawValue
        self.ball.physicsBody!.collisionBitMask = CollideType.Pots.rawValue
        self.ball.physicsBody!.contactTestBitMask = CollideType.Speed.rawValue
        self.ball.physicsBody!.collisionBitMask = CollideType.Speed.rawValue
        self.ball.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
        self.ball.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
        self.ball.physicsBody!.contactTestBitMask = CollideType.Gravity.rawValue
        self.ball.physicsBody!.collisionBitMask = CollideType.Gravity.rawValue
        
        self.ball1.position = CGPoint(x: self.frame.minX + 80, y: (self.frame.minY + 108.5))
        self.ball1.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball1.size.width / 3))
        self.ball1.physicsBody!.affectedByGravity = false
        self.ball1.physicsBody!.categoryBitMask = CollideType.Ball.rawValue
        self.ball1.physicsBody!.contactTestBitMask = CollideType.Pots.rawValue
        self.ball1.physicsBody!.collisionBitMask = CollideType.Pots.rawValue
        self.ball1.physicsBody!.contactTestBitMask = CollideType.Speed.rawValue
        self.ball1.physicsBody!.collisionBitMask = CollideType.Speed.rawValue
        self.ball1.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
        self.ball1.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
        self.ball1.physicsBody!.contactTestBitMask = CollideType.Gravity.rawValue
        self.ball1.physicsBody!.collisionBitMask = CollideType.Gravity.rawValue
        
        self.ball3.position = CGPoint(x: self.frame.minX + 80, y: (self.frame.minY + 109))
        self.ball3.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball3.size.width / 3))
        self.ball3.physicsBody!.affectedByGravity = false
        self.ball3.physicsBody!.categoryBitMask = CollideType.Ball.rawValue
        self.ball3.physicsBody!.contactTestBitMask = CollideType.Pots.rawValue
        self.ball3.physicsBody!.collisionBitMask = CollideType.Pots.rawValue
        self.ball3.physicsBody!.contactTestBitMask = CollideType.Speed.rawValue
        self.ball3.physicsBody!.collisionBitMask = CollideType.Speed.rawValue
        self.ball3.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
        self.ball3.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
        self.ball3.physicsBody!.contactTestBitMask = CollideType.Gravity.rawValue
        self.ball3.physicsBody!.collisionBitMask = CollideType.Gravity.rawValue
        
        self.ball4.position = CGPoint(x: self.frame.minX + 80, y: self.frame.minY + 109)
        self.ball4.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball4.size.width / 3))
        self.ball4.physicsBody!.affectedByGravity = false
        self.ball4.physicsBody!.categoryBitMask = CollideType.Ball.rawValue
        self.ball4.physicsBody!.contactTestBitMask = CollideType.Pots.rawValue
        self.ball4.physicsBody!.collisionBitMask = CollideType.Pots.rawValue
        self.ball4.physicsBody!.contactTestBitMask = CollideType.Speed.rawValue
        self.ball4.physicsBody!.collisionBitMask = CollideType.Speed.rawValue
        self.ball4.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
        self.ball4.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
        self.ball4.physicsBody!.contactTestBitMask = CollideType.Gravity.rawValue
        self.ball4.physicsBody!.collisionBitMask = CollideType.Gravity.rawValue
        
        self.ball5.position = CGPoint(x: self.frame.minX + 80, y: (self.frame.minY + 109))
        self.ball5.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball5.size.width / 3))
        self.ball5.physicsBody!.affectedByGravity = false
        self.ball5.physicsBody!.categoryBitMask = CollideType.Ball.rawValue
        self.ball5.physicsBody!.contactTestBitMask = CollideType.Pots.rawValue
        self.ball5.physicsBody!.collisionBitMask = CollideType.Pots.rawValue
        self.ball5.physicsBody!.contactTestBitMask = CollideType.Speed.rawValue
        self.ball5.physicsBody!.collisionBitMask = CollideType.Speed.rawValue
        self.ball5.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
        self.ball5.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
        self.ball5.physicsBody!.contactTestBitMask = CollideType.Gravity.rawValue
        self.ball5.physicsBody!.collisionBitMask = CollideType.Gravity.rawValue
        
        self.ball6.position = CGPoint(x: self.frame.minX + 80, y: (self.frame.minY + 109))
        self.ball6.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball6.size.width / 3))
        self.ball6.physicsBody!.affectedByGravity = false
        self.ball6.physicsBody!.categoryBitMask = CollideType.Ball.rawValue
        self.ball6.physicsBody!.contactTestBitMask = CollideType.Pots.rawValue
        self.ball6.physicsBody!.collisionBitMask = CollideType.Pots.rawValue
        self.ball6.physicsBody!.contactTestBitMask = CollideType.Speed.rawValue
        self.ball6.physicsBody!.collisionBitMask = CollideType.Speed.rawValue
        self.ball6.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
        self.ball6.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
        self.ball6.physicsBody!.contactTestBitMask = CollideType.Gravity.rawValue
        self.ball6.physicsBody!.collisionBitMask = CollideType.Gravity.rawValue

        
        self.Pot1.position = CGPoint(x: self.frame.maxX + self.Pot1.size.width, y: self.heroBaseLine - 15 )
        self.Pot2.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 16 )
        if(crash2 == false)
        {
            self.Speed.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 220 )
        }
        if(crash3 == false)
        {
            self.Invincible.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 220 )
        }
        if(crash4 == false)
        {
            self.IncreasedGrav.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 220 )
        }
 
        self.origPotPosX = self.Pot1.position.x
        self.origBonusPosX = self.Speed.position.x
        self.origInvinPosX = self.Invincible.position.x
        self.origGravPosX = self.IncreasedGrav.position.x
        
        self.Home.position = CGPoint(x: self.frame.midX - 150 , y: self.frame.maxY - 80)
        self.Pause.position = CGPoint(x: self.frame.midX + 150 , y: self.frame.maxY - 80)
        self.resume.position = CGPoint(x: self.frame.midX + 150 , y: self.frame.maxY - 80)
        
        self.Pot1.physicsBody = SKPhysicsBody(rectangleOf: self.Pot1.size)
        self.Pot1.physicsBody!.isDynamic = false
        self.Pot1.physicsBody!.categoryBitMask = CollideType.Pots.rawValue
        self.Pot1.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
        self.Pot1.physicsBody!.collisionBitMask = CollideType.Ball.rawValue

        self.Pot2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.Pot2.size.width - 15, height: self.Pot2.size.height - 9) )
        self.Pot2.physicsBody!.isDynamic = false
        self.Pot2.physicsBody!.categoryBitMask = CollideType.Pots.rawValue
        self.Pot2.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
        self.Pot2.physicsBody!.collisionBitMask = CollideType.Ball.rawValue
        
        //For bonus
    
            self.Speed.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.Speed.size.width - 15, height: self.Speed.size.height - 9) )
            self.Speed.physicsBody?.isDynamic = false
            self.Speed.physicsBody!.categoryBitMask = CollideType.Speed.rawValue
            self.Speed.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
            self.Speed.physicsBody!.collisionBitMask = CollideType.Ball.rawValue
        
            self.Invincible.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.Invincible.size.width - 15, height: self.Speed.size.height - 9) )
            self.Invincible.physicsBody?.isDynamic = false
            self.Invincible.physicsBody!.categoryBitMask = CollideType.Invincibility.rawValue
            self.Invincible.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
            self.Invincible.physicsBody!.collisionBitMask = CollideType.Ball.rawValue
        
            self.IncreasedGrav.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.IncreasedGrav.size.width - 15, height: self.Speed.size.height - 9) )
            self.IncreasedGrav.physicsBody?.isDynamic = false
            self.IncreasedGrav.physicsBody!.categoryBitMask = CollideType.Gravity.rawValue
            self.IncreasedGrav.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
            self.IncreasedGrav.physicsBody!.collisionBitMask = CollideType.Ball.rawValue
      
        //Obstacles
        blockStatuses["Pot1"] = BlockStatus(isRunning: false, Delay: Random(), CurrentDelay: UInt32(0))
        blockStatuses["Pot2"] = BlockStatus(isRunning: false, Delay: Random(), CurrentDelay: UInt32(0))
        
        //bonus
         BonusStatus["Speed"] = Bonuses(isRunning: false, Delay: RandomBonus(), CurrentDelay: UInt32())
         BonusStatus["Invincible"] = Bonuses(isRunning: false, Delay: RandomBonus(), CurrentDelay: UInt32())
         BonusStatus["gravity"] = Bonuses(isRunning: false, Delay: RandomBonus(), CurrentDelay: UInt32())
        
        self.scoreText.text = "0"
        self.scoreText.fontSize = 42
        self.scoreText.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.clock.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 100)
        self.clock1.position = CGPoint(x: self.frame.midX - 100, y: self.frame.midY + 100)
        self.clock2.position = CGPoint(x: self.frame.midX + 100, y: self.frame.midY + 100)
        
        self.potMaxX = 0 - self.Pot1.size.width / 2
        self.bonusMaxX = 0 - self.Speed.size.width / 2
        
        self.Pot1.name = "Pot1"
        self.Pot2 .name = "Pot2"
        self.Speed.name = "Speed"
        self.Invincible.name = "Invincible"
        self.IncreasedGrav.name = "gravity"
        self.Home.name = "Home"
        self.Pause.name = "Pause"
        self.resume.name = "resume"
        self.clock.name = "clock"
        self.clock1.name = "clock1"
        self.clock2.name = "clock2"
        
        let fail = Bundle.main.path(forResource: "fail", ofType: "mp3")
        let begin = Bundle.main.path(forResource: "Begin", ofType: "mp3")
        let bonuss = Bundle.main.path(forResource: "bonus", ofType: "mp3")
        let bonus1 = Bundle.main.path(forResource: "bonus2", ofType: "mp3")
        
        do {
            self.fail = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: fail! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            self.begin = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: begin! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            self.bonuss = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bonuss! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            self.bonus1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bonus1! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
        }
        catch{
            print("error with music content")
        }
        
        self.addChild(self.movingFloor)
        self.addChild(self.Pot1)
        self.addChild(self.Pot2)
        self.addChild(self.Speed)
        self.addChild(self.Invincible)
        self.addChild(self.IncreasedGrav)
        self.addChild(self.scoreText)
        self.addChild(self.Home)
        self.addChild(self.Pause)
        
        if (Setting.Option == "Ball2")
        {
            self.addChild(self.ball)
        }
        else if (Setting.Option == "Ball1")
        {
            self.addChild(self.ball1)
        }
        else if (Setting.Option == "Ball3")
        {
            self.addChild(self.ball3)
        }
        else if (Setting.Option == "Ball4")
        {
            self.addChild(self.ball4)
        }
        else if (Setting.Option == "Ball5")
        {
            self.addChild(self.ball5)
        }
        else if (Setting.Option == "Ball6")
        {
            self.addChild(self.ball6)
        }
        
        if (GameScene.check2 == true)
        {
            GameViewController.audioPlayer.play()
        }

    }
    

    //function to bring obstacles in at random moments
    func Random() -> UInt32
    {
        let end = self.range.endIndex
        let start = self.range.startIndex
        let interval = (end - start + 1)
        return self.range.startIndex + arc4random_uniform(interval)
    }
    
    func RandomBonus() -> UInt32
    {
        var range1 = UInt32(50)..<UInt32(800)
        let end = range1.endIndex
        let start = range1.startIndex
        let interval = (end - start + 1)
        return self.range.startIndex + arc4random_uniform(interval)
        
    }
    
    var blockStatuses: Dictionary<String,BlockStatus> = [:]
    var BonusStatus: Dictionary<String, Bonuses> = [:]
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches
        {
            let location = touch.location(in: self)
            if self.atPoint(location) == self.Home
            {
                self.bonus1.stop()
                self.bonuss.stop()
                self.isPaused = true
                let alert = PCLBlurEffectAlert.Controller(title: "Quit Game", message: "Are you sure?", effect: UIBlurEffect(style: .prominent), style: .alertVertical)
                let alertBtn1 = PCLBlurEffectAlert.Action(title: "Proceed", style: .default) { (action) in
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
                let alertBtn  = PCLBlurEffectAlert.Action(title: "Cancel", style: .cancel) { (action) in
                    self.isPaused = false
                }
                //Alert stuff
                alert.addAction(alertBtn1)
                alert.addAction(alertBtn)
                alert.configure(cornerRadius: 60)
                alert.configure(overlayBackgroundColor: UIColor(displayP3Red: 0, green: 0, blue: 60, alpha: 0.3))
                alert.configure(titleFont: UIFont.init(name: "Chalkduster", size: 30)! , titleColor: UIColor.blue)
                //alert.configure(messageFont: UIFont.systemFont(ofSize: 20), messageColor: UIColor.white)
                alert.configure(messageFont: UIFont.init(name: "Chalkduster", size: 25)! , messageColor: UIColor.white)
                alert.show()
                if (GameScene.check == false )
                {
                    GameViewController.audioPlayerT.play()
                }
            }
            
            if self.atPoint(location) == self.Pause
            {
                self.bonus1.stop()
                self.bonuss.stop()
                self.isPaused = true
                self.childNode(withName: "Pause")?.removeFromParent()
                self.addChild(self.resume)
                self.status = false
                let alert1 = PCLBlurEffectAlert.Controller(title: "Game Paused", message: "Best Score: \(GameScene.best) \n Current Score: \(self.score)", effect: UIBlurEffect(style: .prominent), style: .actionSheet)
                let alertBtn1  = PCLBlurEffectAlert.Action(title: "Resume", style: .cancel) { (action) in
                    self.childNode(withName: "resume")?.removeFromParent()
                    self.addChild(self.Pause)
                    self.status = true
                    sleep(1 / 2)
                    self.isPaused = false
                }
                let alertBtn2 = PCLBlurEffectAlert.Action(title: "Quit Game", style: .default) { (action) in
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
                //Alert stuff
                alert1.addAction(alertBtn1)
                alert1.addAction(alertBtn2)
                alert1.configure(cornerRadius: 15)
                alert1.configure(overlayBackgroundColor: UIColor(displayP3Red: 0, green: 0, blue: 60, alpha: 0.3))
                alert1.configure(titleFont: UIFont.init(name: "Chalkduster", size: 30)! , titleColor: UIColor.blue)
                //alert.configure(messageFont: UIFont.systemFont(ofSize: 20), messageColor: UIColor.white)
                alert1.configure(messageFont: UIFont.init(name: "Chalkduster", size: 25)! , messageColor: UIColor.white)
                alert1.show()
            }
            
            
        }
        
        if (onGround && Grav)
        {
            self.velocityY = -18.0
            self.onGround = false
            if (GameScene.check == false)
            {
                GameViewController.audioPlayerT.play()
            }
        }
        else if (onGround && Grav == false)
        {
            self.velocityY = -10.0
            self.onGround = false
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.velocityY < -9.0)
        {
            self.velocityY = -9.0
        }
    }
    override func update(_ currentTime: TimeInterval) {
        if self.movingFloor.position.x <= maxBarX
        {
            self.movingFloor.position.x = self.origMovingFloorPos
        }
        if (crash2 == true)
        {
            self.Speed.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 520 )
        }
        if (crash3 == true)
        {
            self.Invincible.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 520 )
        }
        if (crash4 == true)
        {
            self.IncreasedGrav.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 520 )
        }
        
        
        //moving floor
        movingFloor.position.x -= CGFloat(self.groundSpeed)
        
        //rotation
        let degreeRotation = CDouble(self.groundSpeed)*Double.pi / 180
        self.ball.zRotation -= CGFloat(degreeRotation)
        self.ball1.zRotation -= CGFloat(degreeRotation)
        self.ball3.zRotation -= CGFloat(degreeRotation)
        self.ball4.zRotation -= CGFloat(degreeRotation)
        self.ball5.zRotation -= CGFloat(degreeRotation)
        self.ball6.zRotation -= CGFloat(degreeRotation)
        
        //Jump
        self.velocityY += self.gravity
        self.ball.position.y -= velocityY
        self.ball1.position.y -= velocityY
        self.ball3.position.y -= velocityY
        self.ball4.position.y -= velocityY
        self.ball5.position.y -= velocityY
        self.ball6.position.y -= velocityY
        
        if (self.ball.position.y < self.heroBaseLine)
        {
            self.ball.position.y = self.heroBaseLine
            self.ball1.position.y = self.heroBaseLine
            self.ball3.position.y = self.heroBaseLine
            self.ball4.position.y = self.heroBaseLine
            self.ball5.position.y = self.heroBaseLine
            self.ball6.position.y = self.heroBaseLine
            velocityY = 0.0
            self.onGround = true
        }
        
        PotLoader()
        BonusLoader()
        
    }
    func BonusLoader()
    {
     if self.groundSpeed >= 7
     {
        for ( Bonus, Bonuses ) in self.BonusStatus
        {
            let thisBonus = self.childNode(withName: Bonus) as! SKNode
            if Bonuses.RunNextBonus()
            {
                Bonuses.delay = Random()
                Bonuses.CurrentDelay = 0;
                Bonuses.isRunning = true
            }
            
            if (Bonuses.isRunning)
            {
                if ( thisBonus.position.x > bonusMaxX )
                {
                    thisBonus.position.x -= CGFloat(self.groundSpeed)
                }
                else {
                    thisBonus.position.x = self.origBonusPosX
                    Bonuses.isRunning = false
                }
            }
            else
            {
                Bonuses.CurrentDelay += 1
            }
        }
      }
    }
    
    func PotLoader()
    {
       
        for ( Pot, BlockStatus ) in self.blockStatuses
        {
            let thisPot = self.childNode(withName: Pot) as! SKNode
            if BlockStatus.RunNextPot()
            {
                BlockStatus.delay = Random()
                BlockStatus.CurrentDelay = 0;
                BlockStatus.isRunning = true
            }
            
            if (BlockStatus.isRunning)
            {
                if ( thisPot.position.x > potMaxX )
                {
                    thisPot.position.x -= CGFloat(self.groundSpeed)
                }
               else if (thisPot.position.x < potMaxX){
                    thisPot.position.x = self.origPotPosX
                    BlockStatus.isRunning = false
                    score += 1//incrementing score

                    //increasing speed and difficulty
                    if ((score % 5) == 0)
                    {
                        self.groundSpeed += 1
                        self.tracker = self.groundSpeed
                    }
                    self.scoreText.text = String(score)
                    
                    let defaults = UserDefaults.standard
                    let MaxScore = defaults.integer(forKey: "HighScore")
                    if (self.score > MaxScore) {
                        self.key = true
                        let defaults = UserDefaults.standard
                        defaults.set(score, forKey: "HighScore")
                        PlayScene.scorekeep = self.score
                     }//End Scoring if
                }
            }
            else
            {
                BlockStatus.CurrentDelay += 1
            }
        }//close for loop
    }
    
    //Collision functions
    var tempScore = 0
    func didBegin(_ contact: SKPhysicsContact) {
        
        if (contact.bodyA.categoryBitMask == CollideType.Gravity.rawValue)
        {
            self.crash4 = true
            if (GameScene.check == false && self.crash == false)
            {
                self.bonus1.play()
            }
            self.addChild(self.clock1)
            self.ball.physicsBody?.collisionBitMask = 0
            self.ball1.physicsBody?.collisionBitMask = 0
            self.ball3.physicsBody?.collisionBitMask = 0
            self.ball4.physicsBody?.collisionBitMask = 0
            self.ball5.physicsBody?.collisionBitMask = 0
            self.ball6.physicsBody?.collisionBitMask = 0
            self.IncreasedGrav.isHidden = true
            self.Grav = false
            if (self.onGround)
            {
                self.velocityY = -10.0
                self.onGround = false
            }
            
            let dlT11 = DispatchTime.now() + .seconds(7)
            DispatchQueue.main.asyncAfter(deadline: dlT11)
            {
                self.childNode(withName: "clock1")?.removeFromParent()
            }
            let dlT12 = DispatchTime.now() + .seconds(8)
            DispatchQueue.main.asyncAfter(deadline: dlT12)
            {
                self.addChild(self.clock1)
            }
            let dlT23 = DispatchTime.now() + .seconds(9)
            DispatchQueue.main.asyncAfter(deadline: dlT23)
            {
                self.childNode(withName: "clock1")?.removeFromParent()
            }
            let dlT34 = DispatchTime.now() + .seconds(10)
            DispatchQueue.main.asyncAfter(deadline: dlT34)
            {
                self.addChild(self.clock1)
            }
            let deadlineTime1 = DispatchTime.now() + .seconds(11)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime1)
            {
                self.childNode(withName: "clock1")?.removeFromParent()
                self.Grav = true
                self.onGround = false
                self.crash4 = false
                self.IncreasedGrav.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 220 )
                self.IncreasedGrav.isHidden = false
            }
            
        }
            //invincibility collision
        else if (contact.bodyA.categoryBitMask == CollideType.Invincibility.rawValue)
        {
            self.crash3 = true
            if (GameScene.check == false && self.crash == false)
            {
                self.bonus1.play()
            }
            
            self.addChild(self.clock2)
            self.ball.physicsBody?.collisionBitMask = 0
            self.ball1.physicsBody?.collisionBitMask = 0
            self.ball3.physicsBody?.collisionBitMask = 0
            self.ball4.physicsBody?.collisionBitMask = 0
            self.ball5.physicsBody?.collisionBitMask = 0
            self.ball6.physicsBody?.collisionBitMask = 0
            self.Invincible.isHidden = true
            
            self.Pot1.physicsBody = SKPhysicsBody(rectangleOf: self.Pot1.size)
            self.Pot1.physicsBody!.isDynamic = false
            self.Pot1.physicsBody!.categoryBitMask = CollideType.Pots.rawValue
            self.Pot1.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
            self.Pot1.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
            
            self.Pot2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.Pot2.size.width - 15, height: self.Pot2.size.height - 9) )
            self.Pot2.physicsBody!.isDynamic = false
            self.Pot2.physicsBody!.categoryBitMask = CollideType.Pots.rawValue
            self.Pot2.physicsBody!.contactTestBitMask = CollideType.Invincibility.rawValue
            self.Pot2.physicsBody!.collisionBitMask = CollideType.Invincibility.rawValue
            
            let dlT_11 = DispatchTime.now() + .seconds(7)
            DispatchQueue.main.asyncAfter(deadline: dlT_11)
            {
                self.childNode(withName: "clock2")?.removeFromParent()
            }
            let dlT_12 = DispatchTime.now() + .seconds(8)
            DispatchQueue.main.asyncAfter(deadline: dlT_12)
            {
                self.addChild(self.clock2)
            }
            let dlT_23 = DispatchTime.now() + .seconds(9)
            DispatchQueue.main.asyncAfter(deadline: dlT_23)
            {
                self.childNode(withName: "clock2")?.removeFromParent()
            }
            let dlT_34 = DispatchTime.now() + .seconds(10)
            DispatchQueue.main.asyncAfter(deadline: dlT_34)
            {
                self.addChild(self.clock2)
            }
            let deadlineTime_ = DispatchTime.now() + .seconds(11)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime_)
            {
                self.crash3 = false
                self.childNode(withName: "clock2")?.removeFromParent()
                self.Pot1.physicsBody = SKPhysicsBody(rectangleOf: self.Pot1.size)
                self.Pot1.physicsBody!.isDynamic = false
                self.Pot1.physicsBody!.categoryBitMask = CollideType.Pots.rawValue
                self.Pot1.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
                self.Pot1.physicsBody!.collisionBitMask = CollideType.Ball.rawValue
                
                self.Pot2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.Pot2.size.width - 15, height: self.Pot2.size.height - 9) )
                self.Pot2.physicsBody!.isDynamic = false
                self.Pot2.physicsBody!.categoryBitMask = CollideType.Pots.rawValue
                self.Pot2.physicsBody!.contactTestBitMask = CollideType.Ball.rawValue
                self.Pot2.physicsBody!.collisionBitMask = CollideType.Ball.rawValue
       
                self.Invincible.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 220 )
                self.Invincible.isHidden = false
            }
            
        }
            //speed collision
        else if (contact.bodyA.categoryBitMask == CollideType.Speed.rawValue)
        {
            self.crash = true
            self.crash2 = true
            self.Speed.isHidden = true
            self.addChild(self.clock)
            if ((GameScene.check2 == true) && (GameScene.check == false))
            {
                 GameViewController.audioPlayer.pause()
                 bonuss.play()
            }
            else if (GameScene.check == false)
            {
                bonuss.play()
            }
             self.ball.physicsBody?.collisionBitMask = 0
             self.ball1.physicsBody?.collisionBitMask = 0
             self.ball3.physicsBody?.collisionBitMask = 0
             self.ball4.physicsBody?.collisionBitMask = 0
             self.ball5.physicsBody?.collisionBitMask = 0
             self.ball6.physicsBody?.collisionBitMask = 0
            
             var c = true
             if self.groundSpeed >= 7
             {
                self.groundSpeed = self.groundSpeed - 3
                var c = false
             }
            
            //Appear and Disappear effect
            let dlT = DispatchTime.now() + .seconds(7)
            DispatchQueue.main.asyncAfter(deadline: dlT)
            {
                self.childNode(withName: "clock")?.removeFromParent()
            }
            let dlT1 = DispatchTime.now() + .seconds(8)
            DispatchQueue.main.asyncAfter(deadline: dlT1)
            {
                self.addChild(self.clock)
            }
            let dlT2 = DispatchTime.now() + .seconds(9)
            DispatchQueue.main.asyncAfter(deadline: dlT2)
            {
                 self.childNode(withName: "clock")?.removeFromParent()
            }
            let dlT3 = DispatchTime.now() + .seconds(10)
            DispatchQueue.main.asyncAfter(deadline: dlT3)
            {
                self.addChild(self.clock)
            }
             let deadlineTime = DispatchTime.now() + .seconds(11)
             DispatchQueue.main.asyncAfter(deadline: deadlineTime)
             {
                self.crash = false
                self.crash2 = false
                self.childNode(withName: "clock")?.removeFromParent()
                //self.bonuss.stop()
                if (GameScene.check2 == true)
                {
                    GameViewController.audioPlayer.play()
                }
                if (self.self.groundSpeed >= 5 && c == false)
                {
                    self.groundSpeed = self.groundSpeed + 3
                }
                else if (self.self.groundSpeed >= 5 && c == true)
                {
                    self.groundSpeed = 7
                }
                else
                {
                    self.groundSpeed = 7
                }
                self.Speed.position = CGPoint(x: self.frame.maxX + self.Pot2.size.width, y: self.heroBaseLine + 220 )
                self.Speed.isHidden = false
                
             }
        }
        else {
            if (GameScene.check == false)
            {
                fail.play()
                sleep(3)
            }
            else{
                sleep(1)
            }
            bonuss.stop()
            
            died()
            
        }
    }
    func died()
    {
        self.crash = false
        self.crash2 = false
        self.bonuss.stop()
        self.bonus1.stop()
        if (self.key) {
            let alert2 = PCLBlurEffectAlert.Controller(title: "New High Score!!!!!!", message: "Previous Score: \(GameScene.scoreTrack) \n New Score: \(self.score)", effect: UIBlurEffect(style: .dark), style: .actionSheet)
            alert2.configure(cornerRadius: 30)
            alert2.configure(overlayBackgroundColor: UIColor(displayP3Red: 0, green: 0, blue: 60, alpha: 0.3))
            alert2.configure(titleFont: UIFont.init(name: "Chalkduster", size: 30)! , titleColor: UIColor.blue)
            alert2.configure(messageFont: UIFont.init(name: "Chalkduster", size: 25)! , messageColor: UIColor.white)
            alert2.show()
            let deadlineTime = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadlineTime)
            {
                alert2.dismiss(animated: true, completion: nil)
            }
            self.key = false
        }
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
