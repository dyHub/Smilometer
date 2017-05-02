//
//  EmotionSelectionViewController.swift
//  Smilometer
//
//  Created by Yuhan Dai on 4/26/17.
//  Copyright © 2017 Yuhan Dai. All rights reserved.
//


import UIKit

class EmotionSelectionViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var currentEmotionImage: UIImageView!
    @IBOutlet weak var leftEmotionImage: UIImageView!
    @IBOutlet weak var rightEmotionImage: UIImageView!
    
    @IBOutlet weak var emotionLable: UILabel!
    @IBOutlet weak var saveEmotionButton: UIButton!
    
    // MARK: Properties
    // array of available emotions
    var EmotinoNames: [String] = [
        "Happy",
        "Sad",
        "Anxious",
        "Tired",
        "Angry",
        "Neutral"
    ]
    
    // index for current emotion image
    var emotionIndex = 0
    
    
    
    // MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // setup images for selected emotions
        updateCurrentEmotion()
        
        // add swipe gesture
        addSwipeGestureForEmotionSelection()
        
    }
    

    // MARK: Actions
    @IBAction func respondToSwipeGesture(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right:
            //write your logic for right swipe
            // debugPrint("Swiped right")
            emotionIndex -= 1
            emotionIndex = emotionIndex < 0 ? EmotinoNames.count-1 : emotionIndex
            break
            
            
        case UISwipeGestureRecognizerDirection.left:
            //write your logic for left swipe
            // debugPrint("Swiped left")
            emotionIndex += 1
            emotionIndex = emotionIndex >= EmotinoNames.count ? 0 : emotionIndex
            break
            
        default:
            break
        }
        
        updateCurrentEmotion()
        
    }
    
    @IBAction func recordCurrentEmotion(_ sender: Any) {
        debugPrint("clicked")
        debugPrint(EmotinoNames[emotionIndex])
        let RecordEmotionVC = storyboard?.instantiateViewController(withIdentifier: "RecordEmotionViewController") as! RecordEmotionViewController
        RecordEmotionVC.emotionString = EmotinoNames[emotionIndex]
        self.present(RecordEmotionVC, animated: true, completion: nil)
    }
    
    
    // MARK: helper functions
    func addSwipeGestureForEmotionSelection() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(EmotionSelectionViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(EmotionSelectionViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    func updateCurrentEmotion() {
        let totalEmotionCount = EmotinoNames.count
        
        currentEmotionImage.image = UIImage(named: EmotinoNames[emotionIndex])
        leftEmotionImage.image = emotionIndex < 1 ? UIImage(named: EmotinoNames[totalEmotionCount-1]) : UIImage(named: EmotinoNames[emotionIndex-1])
        rightEmotionImage.image = emotionIndex >= totalEmotionCount-1 ? UIImage(named: EmotinoNames[0]) : UIImage(named: EmotinoNames[emotionIndex+1])
        
        emotionLable.text = EmotinoNames[emotionIndex]
    }
    
}
