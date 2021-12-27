//
//  ViewController.swift
//  DEMO_OCR
//
//  Created by Nguyen Anh on 27/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapNextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ControlViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ControlViewController")
        self.present(vc, animated: true)
    }
    
}

