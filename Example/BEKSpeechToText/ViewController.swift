//
//  ViewController.swift
//  Example
//
//  Created by Behrad Kazemi on 12/30/19.
//  Copyright © 2019 BEKApps. All rights reserved.
//

import UIKit
import BEKSpeechToText
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var responseLabel: UILabel!
    private let speechToTextManager = BEKSpeech()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonContainer.backgroundColor = .blue
        speechToTextManager.requestPermission { (allowed) in
            if allowed {
                //Do Something
            }else {
                //Do Somthing else
            }
        }
        speechToTextManager.configuration = MyConfiguration()
        setup()
    }
    
    func setup(){
        speechToTextManager.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutSubviews()
        buttonContainer.layer.cornerRadius = buttonContainer.bounds.height / 2
    }
    
    @IBAction func startRecording(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.buttonContainer.backgroundColor = .red
        }
        speechToTextManager.startRecording()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.buttonContainer.backgroundColor = .blue
        }
        speechToTextManager.stopRecording()
    }
}

extension ViewController: BEKSpeechDelegate {
    
    func speech(didReceiveContectText text: String) {
        print(text)
        responseLabel.text = text
    }
    
    func speech(didReceiveError error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
