//
//  ViewController.swift
//  ROGoogleTranslate
//
//  Created by Robin Oster on 20/10/16.
//  Copyright © 2016 prine.ch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var text:UITextField!
    @IBOutlet var fromLanguage:UITextField!
    @IBOutlet var toLanguage:UITextField!
    @IBOutlet var translation:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func translate() {
        let translator = ROGoogleTranslate()
        translator.apiKey = "AIzaSyBobMU3pSEez-Ux7rlEh02joa7QmkY5BC4" // Add your API Key here
        
        var params = ROGoogleTranslateParams()
        params.source = fromLanguage.text ?? "en"
        params.target = toLanguage.text ?? "de"
        params.text = text.text ?? "The textfield is empty"
        
        translator.translate(params: params) { (result) in
            DispatchQueue.main.async {
                self.translation.text = "\(result)"
            }
        }
    }
}

