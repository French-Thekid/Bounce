//
//  Bonuses.swift
//  Bounce
//
//  Created by Darryl Brown on 1/18/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import Foundation
import SpriteKit
import PCLBlurEffectAlert

class Bonuses
{
    var isRunning = false
    var delay = UInt32(0)
    var CurrentDelay = UInt32(0)
    
    init( isRunning: Bool, Delay: UInt32, CurrentDelay: UInt32)
    {
        self.CurrentDelay = CurrentDelay
        self.delay = Delay
        self.isRunning = isRunning
    }

    func RunNextBonus () -> Bool
    {
        return CurrentDelay > delay
    }
}
