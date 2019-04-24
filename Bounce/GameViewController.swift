//
//  GameViewController.swift
//  Bounce
//
//  Created by Darryl Brown on 1/11/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
   // var audioPlayer = AVAudioPlayer()
    static var audioPlayer = AVAudioPlayer()
    static var audioPlayerT = AVAudioPlayer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        
        //Audio
        let music = Bundle.main.path(forResource: "Song2", ofType: "mp3")
        let sound = Bundle.main.path(forResource: "song", ofType: "mp3")

        do {
            GameViewController.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: music! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
            
            GameViewController.audioPlayerT = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound! ))
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryAmbient)
            try AVAudioSession.sharedInstance().setActive(true)
        }
        catch{
            print(error)
        }
        
        let scene1 = SplashScreen()
        let skView1 = self.view as! SKView
        skView1.ignoresSiblingOrder = true
        scene1.scaleMode = .resizeFill
        scene1.size = skView1.bounds.size
        skView1.presentScene(scene1)
        
    }

    override func viewDidAppear(_ animated: Bool) {
      //  self.PopUpAlert(message: "Quit Game",text: "Are you Sure you want to quit")
        
    }
    
    func PopUpAlert(message: String, text: String)
    {
        let alert = UIAlertController(title: message, message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
