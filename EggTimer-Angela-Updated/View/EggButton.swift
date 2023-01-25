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
        setTitleColor(.black, for: .normal)
        
//        NSLayoutConstraint.activate([
//            self.heightAnchor.constraint(equalToConstant: 200)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
