//
//  ViewController.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit

enum EggImage: String {
    case soft_egg
    case medium_egg
    case hard_egg
}

enum ConditionEgg: String {
    case soft
    case medium
    case hard
}

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    let offset: CGFloat = 8.0
    
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "How do you like your eggs?"
        lable.font = UIFont.systemFont(ofSize: 26)
        lable.textAlignment = .center
        lable.numberOfLines = 0
        return lable
    }()
    
    let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = offset
        return stackView
    }()
    
    let contanerViews: [ContanerView] = [
        .init(
            button: EggButton(title: ConditionEgg.soft.rawValue),
            imageView: EggImageView(UIImage(named: EggImage.soft_egg.rawValue))),
        .init(
            button: EggButton(title: ConditionEgg.medium.rawValue),
            imageView: EggImageView(UIImage(named: EggImage.medium_egg.rawValue))),
        .init(
            button: EggButton(title: ConditionEgg.hard.rawValue),
            imageView: EggImageView(UIImage(named: EggImage.hard_egg.rawValue))),
        ]
    
    let tempView2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }
    
    // MARK: - Start setup

    private func setupe() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        contanerViews.forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        mainStackView.addArrangedSubview(titleLable)
        mainStackView.addArrangedSubview(containerStackView)
        mainStackView.addArrangedSubview(tempView2)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -offset),
            containerStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: offset)])
    }

}

