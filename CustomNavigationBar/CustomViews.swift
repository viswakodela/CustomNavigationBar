//
//  CustomViews.swift
//  CustomNavigationBar
//
//  Created by Viswa Kodela on 6/23/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

let CustomButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "color-depth-of-field-environment-1591447").withRenderingMode(.alwaysOriginal), for: .normal)
    return button
}()
