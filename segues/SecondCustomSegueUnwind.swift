//
//  SecondCustomSegueUnwind.swift
//  segues
//
//  Created by liusilan on 15/1/27.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {
   
    override func perform() {
    
        var firstVCView = self.destinationViewController.view as UIView!
        var thirdVCView = self.sourceViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: thirdVCView)
        
        let screenHeight = UIScreen.mainScreen().bounds.height
        
        firstVCView.transform = CGAffineTransformMakeScale(0.01, 0.01)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            thirdVCView.frame = CGRectOffset(thirdVCView.frame, 0, screenHeight)
            thirdVCView.transform = CGAffineTransformMakeScale(0.01, 0.01)
            
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0, screenHeight)
            firstVCView.transform = CGAffineTransformIdentity

        }) { (flag) -> Void in
            
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
