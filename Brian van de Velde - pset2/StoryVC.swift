//
//  File.swift
//  Brian van de Velde - pset2
//
//  Created by Brian van de Velde on 22-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class StoryVC: UIViewController
{
    @IBOutlet weak var story: UILabel!
    let storie = Story(withText: String())
    
    @IBAction func returnPressed(_ sender: Any)
    {
        self.performSegue(withIdentifier: "returnSegue", sender: self)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        story.text = storie.normalText
        story.sizeToFit()
    }
}
