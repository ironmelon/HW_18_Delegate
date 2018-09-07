//
//  EditViewController.swift
//  HW_18_Delegate
//
//  Created by Oleg Dynnikov on 8/21/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

protocol EditProfileDelegate: class {
    func userDidChange(firstname: String, lastname: String)
    func userDidResetInfo()
}

class EditViewController: UIViewController {

    @IBOutlet private weak var greetingLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var lastnameTextField: UITextField!
    @IBOutlet private weak var overFiftySwitch: UISwitch!
    @IBOutlet private weak var confirmButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    weak var delegate: EditProfileDelegate?

    let buttonRadius: CGFloat = 15.0

    var name = ""
    var lastname = ""

// MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettings()
    }

    private func setupSettings() {
        title = "Edit"
        greetingLabel.isHidden = true
        nameTextField.delegate = self
        lastnameTextField.delegate = self
        nameTextField.text = name
        lastnameTextField.text = lastname
        confirmButton.rounded(radius: buttonRadius)
        resetButton.rounded(radius: buttonRadius)
        updateGreetingText()
    }

    private func hideKeyboard() {
        view.endEditing(true)
    }

    private func updateGreetingText() {
        checkedTextFields()
        if overFiftySwitch.isOn {
            greetingLabel.text = "Hello, \(name) \(lastname)!"
        } else { greetingLabel.text = "Hi, \(name)!" }
    }

    private func checkedTextFields() {
        if nameTextField.text != "" ||  lastnameTextField.text != "" {
            greetingLabel.isHidden = false
        } else { greetingLabel.isHidden = true }
    }

// MARK: - IBActions

    @IBAction private func confirmPressed(_ sender: Any) {
        delegate?.userDidChange(firstname: nameTextField.text!, lastname: lastnameTextField.text!)
        updateGreetingText()
    }

    @IBAction private func resetPressed(_ sender: Any) {
        nameTextField.text = ""
        lastnameTextField.text = ""
        greetingLabel.text = ""
        greetingLabel.isHidden = true
        overFiftySwitch.isOn = false
        delegate?.userDidResetInfo()
    }

    @IBAction private func switchChanged(_ sender: Any) {
        updateGreetingText()
    }
}

// MARK: - Extensions

extension EditViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        name = nameTextField.text ?? ""
        lastname = lastnameTextField.text ?? ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == nameTextField {
            textField.resignFirstResponder()
            lastnameTextField.becomeFirstResponder()
        } else { hideKeyboard() }

        return true
    }
}

