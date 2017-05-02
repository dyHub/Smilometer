//
//  RecordEmotionViewController.swift
//  Smilometer
//
//  Created by Yuhan Dai on 5/1/17.
//  Copyright © 2017 Yuhan Dai. All rights reserved.
//


import UIKit

class RecordEmotionViewController: UIViewController {
    
    // MARK: Values
    var emotionString = "Emotion"
    var emotionIndex = 0
    
    // MARK: Outlets
    @IBOutlet weak var emotionImageView: UIImageView!
    @IBOutlet weak var emotionTextLabel: UILabel!
    @IBOutlet weak var questionPromotionLabel: UILabel!
    
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // debugPrint(emotionString)
        // debugPrint(emotionIndex)
        emotionTextLabel.text = emotionString
        emotionImageView.image = UIImage(named: emotionString)
        
        questionPromotionLabel.text = "What made you " + emotionString.lowercased()
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: Actions
    @IBAction func backToSelectEmtion(_ sender: Any) {
        let EmotionSelectionVC = storyboard?.instantiateViewController(withIdentifier: "EmotionSelectionViewController") as! EmotionSelectionViewController
        EmotionSelectionVC.emotionIndex = emotionIndex
        self.present(EmotionSelectionVC, animated: true, completion: nil)

    }
    
    
}
