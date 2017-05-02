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
    
    // MARK: Outlets
    @IBOutlet weak var emotionImageView: UIImageView!
    @IBOutlet weak var emotionTextLabel: UILabel!
    
    
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionTextLabel.text = emotionString
        emotionImageView.image = UIImage(named: emotionString)
    }
    
    // MARK: Actions
    
}
