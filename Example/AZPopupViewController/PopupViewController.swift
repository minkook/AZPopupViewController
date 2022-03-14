//
//  PopupViewController.swift
//  AZPopupViewController_Example
//
//  Created by minkook yoo on 2022/03/14.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import AZPopupViewController

class PopupViewController: AZPopupViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        popupDataSource = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}



// MARK: Button Action
extension PopupViewController {
    @IBAction func dismissButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}



// MARK: AZPopupViewControllerDataSource
extension PopupViewController: AZPopupViewControllerDataSource {

    func backgroundView(in popupViewController: AZPopupViewController) -> UIView {
        return backgroundView
    }

    func contentView(in popupViewController: AZPopupViewController) -> UIView {
        return contentView
    }
}
