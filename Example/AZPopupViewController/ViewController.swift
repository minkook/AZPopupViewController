//
//  ViewController.swift
//  AZPopupViewController
//
//  Created by minkook on 03/14/2022.
//  Copyright (c) 2022 minkook. All rights reserved.
//

import UIKit
import AZPopupViewController

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// MARK: Button Action
extension ViewController {
    
    @IBAction func testButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "PopupViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
}

