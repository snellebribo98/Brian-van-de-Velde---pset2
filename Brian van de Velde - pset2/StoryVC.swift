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
    @IBOutlet weak var storyLabel: UILabel!
    var story: Story!
    
    @IBAction func returnPressed(_ sender: Any)
    {}
    
    // loads screen with the story, filled in words, bold
    override func viewDidLoad()
    {
        super.viewDidLoad()
        storyLabel.attributedText = story.attributedText
        storyLabel.sizeToFit()
    }
}
