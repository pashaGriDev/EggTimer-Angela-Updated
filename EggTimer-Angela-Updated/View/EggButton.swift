//
//  EggButton.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 25.01.23.
//

import UIKit

class EggButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
