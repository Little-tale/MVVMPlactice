//
//  UIVIew.swift
//  MVVMPlactice
//
//  Created by Jae hyung Kim on 2/23/24.
//

import UIKit

extension UIView {
    static var reuseableIdentifier: String {
        return String(describing: self)
    }
}
