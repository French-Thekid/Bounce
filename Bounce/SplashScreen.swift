//
//  SplashScreen.swift
//  Bounce
//
//  Created by Darryl Brown on 1/17/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import PCLBlurEffectAlert
import SpriteKit
import GameplayKit
import AVFoundation
import Foundation

class SplashScreen:SKScene
{
    override func didMove(to view: SKView) {
        GameScene.c = true
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view!.insertSubview(backgroundImage, at: 0)
        
        let deadlineTime = DispatchTime.now() + .seconds(3)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime)
        {
            backgroundImage.image = nil;
            self.backgroundColor = UIColor(hex: 0x80D9FF)
            
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
