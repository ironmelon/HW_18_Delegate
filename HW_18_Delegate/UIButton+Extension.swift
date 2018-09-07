//
//  UIButton+Extension.swift
//  HW_18_Delegate
//
//  Created by Oleg Dynnikov on 9/7/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

extension UIButton {
    func rounded(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
