//
//  PickVC.swift
//  Brian van de Velde - pset2
//
//  Created by Brian van de Velde on 22-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class PickVC: UIViewController
{
    @IBOutlet weak var simpleButton: UIButton!
    @IBOutlet weak var tarzanButton: UIButton!
    @IBOutlet weak var universityButton: UIButton!
    @IBOutlet weak var clothesButton: UIButton!
    @IBOutlet weak var dancingButton: UIButton!
    
    var story: Story!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // if story button pressed, retrieve the info of that story
    @IBAction func storyPressed(_ sender: UIButton)
    {
        switch sender
        {
        case simpleButton:
            let storyPath = Bundle.main.path(forResource: "madlib0_simple", ofType: "txt")
            let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
            story = Story(withText: text)
        case tarzanButton:
            let storyPath = Bundle.main.path(forResource: "madlib1_tarzan", ofType: "txt")
            let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
            story = Story(withText: text)
        case universityButton:
            let storyPath = Bundle.main.path(forResource: "madlib2_university", ofType: "txt")
            let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
            story = Story(withText: text)
        case dancingButton:
            let storyPath = Bundle.main.path(forResource: "madlib3_clothes", ofType: "txt")
            let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
            story = Story(withText: text)
        case clothesButton:
            let storyPath = Bundle.main.path(forResource: "madlib4_dance", ofType: "txt")
            let text = try! String(contentsOfFile: storyPath!, encoding: .utf8)
            story = Story(withText: text)
        default:
            break
        }
        
        performSegue(withIdentifier: "startedSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let started = segue.destination as! StartedVC
        started.story = story
    }
}
