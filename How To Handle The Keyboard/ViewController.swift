//
//  ViewController.swift
//  How To Handle The Keyboard
//
//  Created by Engy on 11/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textLabel: UITextField!
    @IBOutlet var buttonConstrains: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotificationCenter()
        keyboardHidding()
    }
    private func setupNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisplay), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillDisplay(notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRect = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRect.height
            buttonConstrains.constant = keyboardHeight - 30
        }
    }

    @objc func keyboardHide(){
        buttonConstrains.constant = 50
    }



    func keyboardHidding() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(keyboardRemove))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func keyboardRemove(){
        view.endEditing(true)
    }


}

