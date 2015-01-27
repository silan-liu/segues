//
//  FirstCustomSegueUnwind.swift
//  segues
//
//  Created by liusilan on 15/1/27.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {
 
    override func perform(){
     
        var secondVCView = self.sourceViewController.view as UIView!
        var firstVCView  = self.destinationViewController.view as UIView!
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width;
        let screenHeight = UIScreen.mainScreen().bounds.size.height;
        
        let window = UIApplication.sharedApplication().keyWindow;
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)

        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0, screenHeight)
            
        }) { (flag) -> Void in
            
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
