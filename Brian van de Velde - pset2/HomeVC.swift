//
//  ViewController.swift
//  Brian van de Velde - pset2
//
//  Created by Brian van de Velde on 21-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class HomeVC: UIViewController
{
    
    @IBAction func startPressed(_ sender: Any)
    {
        self.performSegue(withIdentifier: "pickSegue", sender: self)
    }
    
    @IBAction func unwindToStart(segue:UIStoryboardSegue) {}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
}
