//
//  ViewController.swift
//  segues
//
//  Created by liusilan on 15/1/27.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblMessage:UILabel!
    @IBAction func returnFromSegueActions(sender:UIStoryboardSegue){
        if sender.identifier == "idFirstSegueUnwind"{
            
            let originalColor = self.view.backgroundColor;
            self.view.backgroundColor = UIColor.redColor()
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.view.backgroundColor = originalColor
            })
        }
        else if sender.identifier == "idSecondSegueUnwind"{
            
            println("return from third")
        }
    }
    
    @IBAction func tapMe(send:UIButton){
        self.performSegueWithIdentifier("idSecondSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        var swipeGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
        
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showSecondViewController(){
        self.performSegueWithIdentifier("idFirstSegue", sender: self)
    }

    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "idFirstSegueUnwind" {
                let unwindSegue = FirstCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
            else if id == "idSecondSegueUnwind"{
                
                let unwindSegue = SecondCustomSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
}

