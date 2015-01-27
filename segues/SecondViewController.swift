//
//  SecondViewController.swift
//  segues
//
//  Created by liusilan on 15/1/27.
//  Copyright (c) 2015年 YY, Inc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblMessage:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var swipeGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showFirstViewController(){
        self.performSegueWithIdentifier("idFirstSegueUnwind", sender: self)
    }
}
