//
//  BlockStatus.swift
//  Bounce
//
//  Created by Darryl Brown on 1/14/18.
//  Copyright © 2018 FrenchCo. All rights reserved.
//

import Foundation

class BlockStatus
{
    var isRunning = false
    var delay = UInt32(0)
    var CurrentDelay = UInt32(0)
    init( isRunning: Bool, Delay: UInt32, CurrentDelay: UInt32)
    {
        self.isRunning = isRunning
        self.CurrentDelay = CurrentDelay
        self.delay = Delay
        
    }
    
    func RunNextPot () -> Bool
    {
        return CurrentDelay > delay
    }
}
