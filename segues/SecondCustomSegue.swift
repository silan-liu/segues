//
//  SecondCustomSegue.swift
//  segues
//
//  Created by liusilan on 15/1/27.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

import UIKit

class SecondCustomSegue: UIStoryboardSegue {
   
    override func perform() {
    
        var firstVCView = self.sourceViewController.view as UIView!
        var thirdVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height;
        let keywindow = UIApplication.sharedApplication().keyWindow

        keywindow?.insertSubview(thirdVCView, aboveSubview: firstVCView)
        
        thirdVCView.frame = CGRectOffset(thirdVCView.frame, 0, screenHeight)
        thirdVCView.transform = CGAffineTransformMakeScale(0.001, 0.001)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0, -screenHeight)
            firstVCView.transform = CGAffineTransformMakeScale(0.001, 0.001)
            thirdVCView.transform = CGAffineTransformIdentity
            thirdVCView.frame = CGRectOffset(thirdVCView.frame, 0, -screenHeight)
            
        }) { (flag) -> Void in
            
            self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
        }
    }
}
