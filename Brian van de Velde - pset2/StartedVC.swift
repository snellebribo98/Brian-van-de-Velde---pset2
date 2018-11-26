//
//  StartedVC.swift
//  Brian van de Velde - pset2
//
//  Created by Brian van de Velde on 21-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class StartedVC: UIViewController
{
    @IBOutlet weak var remainingWords: UILabel!
    @IBOutlet weak var typeWord: UITextField!
    @IBOutlet weak var wordType: UILabel!
    @IBOutlet weak var proceed: UIButton!
   
    var story: Story!
    var stor = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        remainingWords.text = "\(story.totalPlaceholders) word(s) left"
        typeWord.placeholder = "\(story.nextPlaceholder!)"
        wordType.text = "Please type a/an \(story.nextPlaceholder!)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let verhaal = segue.destination as! StoryVC
        verhaal.story = story
    }
    
    @IBAction func okPressed(_ sender: UIButton)
    {
        if typeWord.text == ""
        {
            let alert = UIAlertController(title: "Empty Textfield", message: "Please fill in a word to complete your wonderfull story.", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        else
        {
            story.fillInPlaceholder(word: typeWord.text!)
            if story.isFilledIn
            {
                stor = story.normalText
                performSegue(withIdentifier: "storySegue", sender: proceed)
            }
            else
            {
                updateScreen()
            }
        }
    }
    
    func updateScreen()
    {
        remainingWords.text = "\(story.remainingPlaceholders) word(s) left"
        typeWord.placeholder = "\(story.nextPlaceholder!)"
        typeWord.text = ""
        wordType.text = "Please type a/an \(story.nextPlaceholder!)"
        
        if story.remainingPlaceholders == 1
        {
            proceed.setTitle("Finish", for: .normal)
        }
    }
    
}
