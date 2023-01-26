//
//  EggView.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 26.01.23.
//

import UIKit

class EggView: UIView {
    
    let eggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let eggImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)

        // add subview and add constrants
        [eggImageView, eggButton].forEach {
            self.addSubview($0)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                $0.topAnchor.constraint(equalTo: self.topAnchor),
                $0.leftAnchor.constraint(equalTo: self.leftAnchor),
                $0.rightAnchor.constraint(equalTo: self.rightAnchor),
                $0.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
        }
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String?, image: UIImage?) {
        eggButton.setTitle(text, for: .normal)
        eggImageView.image = image
    }
}
