//
//  ContanerView.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 25.01.23.
//

import UIKit

class ContanerView: UIView {
    init(button: UIButton, imageView: EggImageView) {
        super.init(frame: .zero)
        
        [imageView, button].forEach {
            self.addSubview($0)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
//                $0.topAnchor.constraint(equalTo: self.topAnchor),
//                $0.leftAnchor.constraint(equalTo: self.leftAnchor),
//                $0.rightAnchor.constraint(equalTo: self.rightAnchor),
//                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
                
                $0.widthAnchor.constraint(equalTo: self.widthAnchor),
                $0.heightAnchor.constraint(equalTo: self.heightAnchor)])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
