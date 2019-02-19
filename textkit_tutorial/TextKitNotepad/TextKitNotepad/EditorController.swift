//
//  EditorController.swift
//  TextKitNotepad
//
//  Created by wonkwh on 20/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class EditorController: UIViewController {
    let textView: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var note: Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textView)
        textView.delegate = self
        
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        textView.isScrollEnabled = true
        textView.text = note.contents
        setupNavBar()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Your Note"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    func updateTextViewSizeForKeyboardHeight(keyboardHeight: CGFloat) {
        textView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - keyboardHeight)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        if let rectValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
            let keyboardSize = rectValue.cgRectValue.size
            updateTextViewSizeForKeyboardHeight(keyboardHeight: keyboardSize.height)
        }
    }
    
    @objc func keyboardDidHide(notification: NSNotification) {
        updateTextViewSizeForKeyboardHeight(keyboardHeight: 0)
    }
}

// MARK: - UITextViewDelegate
extension EditorController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note.contents = textView.text
    }
}
