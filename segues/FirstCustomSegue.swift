//
//  FirstCustomSegue.swift
//  segues
//
//  Created by liusilan on 15/1/27.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
   
    override func perform() {
     
        var firstVCView = self.sourceViewController.view as UIView!
        var secondVCView = self.destinationViewController.view as UIView!
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width;
        let screenHeight = UIScreen.mainScreen().bounds.size.height;
        
        secondVCView.frame = CGRectMake(0, screenHeight, screenWidth, screenHeight);
        
        let window = UIApplication.sharedApplication().keyWindow;
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0, -screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0, -screenHeight)
        }) { (Finished) -> Void in
            
            self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
        }
    }
}
