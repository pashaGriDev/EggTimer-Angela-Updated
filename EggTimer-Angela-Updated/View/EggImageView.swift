//
//  EggImageView.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 25.01.23.
//

import UIKit

class EggImageView: UIImageView {
    init(_ eggImage: UIImage?) {
        super.init(image: eggImage)
        
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
