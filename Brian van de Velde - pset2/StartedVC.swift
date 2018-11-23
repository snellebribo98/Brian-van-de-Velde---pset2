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
    var chosenStory = String()
    lazy var tekst = Story.init(withText: "\(chosenStory)")
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        remainingWords.text = "\(tekst.totalPlaceholders) word(s) left"
        typeWord.placeholder = "\(tekst.nextPlaceholder!)"
        wordType.text = "Please type a/an \(tekst.nextPlaceholder!)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //let st = segue.destination as! StoryVC
        //st.storie = chosenStory
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
            tekst.fillInPlaceholder(word: wordType.text!)
            if tekst.isFilledIn
            {
                stor = tekst.normalText
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
        remainingWords.text = "\(tekst.remainingPlaceholders) word(s) left"
        typeWord.placeholder = "\(tekst.nextPlaceholder!)"
        typeWord.text = ""
        wordType.text = "Please type a/an \(tekst.nextPlaceholder!)"
    }
    
}
