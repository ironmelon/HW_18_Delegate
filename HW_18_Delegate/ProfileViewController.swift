//
//  ProfileViewController.swift
//  HW_18_Delegate
//
//  Created by Oleg Dynnikov on 8/21/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var lastnameLabel: UILabel!
    @IBOutlet private weak var editButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        roundedUIElements()
    }

    private func roundedUIElements() {
        nameLabel.rounded(radius: 5.0)
        lastnameLabel.rounded(radius: 5.0)
        editButton.rounded(radius: 15.0)
    }

// MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditVC" else { return }
        guard let editVC = segue.destination as? EditViewController else { return }
        editVC.delegate = self
        editVC.name = nameLabel.text ?? ""
        editVC.lastname = lastnameLabel.text ?? ""
    }
}

// MARK: - EditProfileDelegate

extension ProfileViewController: EditProfileDelegate {
    func userDidChange(firstname: String, lastname: String) {
        nameLabel.text = firstname
        lastnameLabel.text = lastname
    }

    func userDidResetInfo() {
        nameLabel.text = ""
        lastnameLabel.text = ""
    }
}



