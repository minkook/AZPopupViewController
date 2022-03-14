//
//  AZPopupViewController.swift
//  AZPopupViewController
//
//  Created by minkook on 2022/03/14.
//

import UIKit

open class AZPopupViewController: UIViewController {
    
    
    // MARK: DataSource
    weak open var popupDataSource: AZPopupViewControllerDataSource?
    
    weak open var dismissAppearanceSelector: UIViewController?
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        modalPresentationStyle = .overCurrentContext
    }
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        assert(popupDataSource != nil, "popupDataSource is nil.")
        
        if let popupDataSource = popupDataSource {
            popupDataSource.backgroundView(in: self).isHidden = true
            popupDataSource.contentView(in: self).isHidden = true
        }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let popupDataSource = popupDataSource else { return }

        let backgroundView = popupDataSource.backgroundView(in: self)
        let contentView = popupDataSource.contentView(in: self)

        let bgAlpha = backgroundView.alpha
        backgroundView.alpha = 0.0
        backgroundView.isHidden = false

        let ty = contentView.bounds.height
        contentView.transform = CGAffineTransform(translationX: 0, y: ty)
        contentView.isHidden = false

        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseOut) {
            backgroundView.alpha = bgAlpha
            contentView.transform = .identity
        } completion: { _ in
            //
        }
    }
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        let completionHandler = {
            if let completion = completion {
                completion()
            }
            
            if let dismissAppearanceSelector = self.dismissAppearanceSelector {
                dismissAppearanceSelector.beginAppearanceTransition(true, animated: true)
                dismissAppearanceSelector.endAppearanceTransition()
            }
        }
        
        guard let popupDataSource = popupDataSource else {
            super.dismiss(animated: false, completion: completionHandler)
            return
        }
        
        if flag {
            let backgroundView = popupDataSource.backgroundView(in: self)
            let contentView = popupDataSource.contentView(in: self)
            let ty = contentView.bounds.height
            
            UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1.5, options: .curveEaseIn) {
                backgroundView.alpha = 0.0
                contentView.transform = CGAffineTransform(translationX: 0, y: ty)
            } completion: { _ in
                super.dismiss(animated: false, completion: completionHandler)
            }
        } else {
            super.dismiss(animated: false, completion: completionHandler)
        }
    }

}



public protocol AZPopupViewControllerDataSource: NSObjectProtocol {
    
    func backgroundView(in popupViewController: AZPopupViewController) -> UIView
    
    func contentView(in popupViewController: AZPopupViewController) -> UIView
    
}
