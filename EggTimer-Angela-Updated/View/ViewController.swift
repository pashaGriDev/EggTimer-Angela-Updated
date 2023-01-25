//
//  ViewController.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLable: UILabel = {
        let lable = UILabel()
        lable.text = "How do you like your eggs?"
        lable.font = UIFont.systemFont(ofSize: 26)
        lable.textAlignment = .center
        lable.numberOfLines = 0
        return lable
    }()
    
    lazy var mainStackView: UIStackView = {
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
        return stackView
    }()
    
    let tempView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let tempView2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
    }

    private func setupe() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(titleLable)
        mainStackView.addArrangedSubview(tempView)
        mainStackView.addArrangedSubview(tempView2)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }

}

