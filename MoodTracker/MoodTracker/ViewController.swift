//
//  ViewController.swift
//  MoodTracker
//
// The app spacing isn't the prettiest, but it at least displays correctly
// on different devices, and with landscape and portrait.
//
//  Created by Noah Flood on 6/16/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moodLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var moodSlider: UISlider!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // make the message blank at the startup
        messageLabel.text = ""
        // initalize the label with whatever the slider is at (should be 50)
        moodSelected(moodSlider)
    }

    @IBAction func moodSelected(_ sender: UISlider) {
        // switch statement a little cleaner than if-else statements
        switch Int(sender.value) {
        case 0...20:
            moodLabel.text = "Very Sad 😢"
        case 21...40:
            moodLabel.text = "Sad 🙁"
        case 41...60:
            moodLabel.text = "Neutral 😐"
        case 61...80:
            moodLabel.text = "Happy 🙂"
        case 81...100:
            moodLabel.text = "Very Happy 😄"
        default:
            moodLabel.text = "Unknown"
        }
    }
        
    @IBAction func saveMoodPressed(_ sender: UIButton) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let dateString = formatter.string(from: datePicker.date) // this is how you actually access the date from the date picker
        
        // this second format string basically says
        // use moodLabel text if it isn't nil, otherwise, substitute it
        // for empty string
        messageLabel.text = "On \(dateString), you felt \(moodLabel.text ?? "")"
    }
    
}

