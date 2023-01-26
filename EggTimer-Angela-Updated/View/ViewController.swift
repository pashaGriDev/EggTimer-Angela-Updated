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

enum EggHardness: String {
    case soft
    case medium
    case hard
}

class ViewController: UIViewController {
    
    // MARK: - Constants
    
    let offset: CGFloat = 8.0
    
    var timer = Timer()
    var totalTimer = 0
    var secondsPassed = 0
    
    let eggTimes: [String : Int] = [
        EggHardness.soft.rawValue : 3,
        EggHardness.medium.rawValue : 5,
        EggHardness.hard.rawValue : 7]
    
    let progressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressViewStyle = .default
        progress.trackTintColor = .systemGray6
        progress.progressTintColor = .orange
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
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
    
    let eggButtons: [EggButton] = [
        .init(title: EggHardness.soft.rawValue),
        .init(title: EggHardness.medium.rawValue),
        .init(title: EggHardness.hard.rawValue)]
    
    let eggImageView: [EggImageView] = [
        .init(UIImage(named: EggImage.soft_egg.rawValue)),
        .init(UIImage(named: EggImage.medium_egg.rawValue)),
        .init(UIImage(named: EggImage.hard_egg.rawValue))]
    
    lazy var containerForProgressView: UIView = {
        let view = UIView()
        view.addSubview(progressView)
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
        
        // add targets
        eggButtons.forEach { button in
            button.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
        }
        
        conteinerViews().forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        [titleLable, containerStackView, containerForProgressView].forEach {
            mainStackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -offset),
            containerStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: offset),
        
            progressView.leftAnchor.constraint(equalTo: containerForProgressView.leftAnchor, constant: 20),
            progressView.rightAnchor.constraint(equalTo: containerForProgressView.rightAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 10),
            progressView.centerYAnchor.constraint(equalTo: containerForProgressView.centerYAnchor)])
    }
    
    // MARK: - Methods
    
    @objc func countdownTimer() {
        
        if totalTimer == secondsPassed {
            timer.invalidate()
            print("DONE!!!!")
        }
        
        progressView.progress = Float(secondsPassed) / Float(totalTimer)
        print("countdownTimer - \(Float(secondsPassed) / Float(totalTimer))")

        secondsPassed += 1
    }
    
    @objc func didPressed(_ sender: UIButton) {
        
        // check value by key and assign totalTimer
        if let value = sender.currentTitle,
            let eggCondition = eggTimes[value] {
            totalTimer = eggCondition
        } else {
            print("No keys!!!")
        }
        
        if timer.isValid {
            timer.invalidate()
        } else {
            progressView.setProgress(0.0, animated: true)
            progressView.progress = 0.0
            secondsPassed = 0
            createTimer()
        }
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countdownTimer),
            userInfo: nil,
            repeats: true)
        timer.tolerance = 0.2
    }
    
    private func conteinerViews() -> [ContanerView] {
        var result: [ContanerView] = []
        let countImage = eggImageView.count
        let countButton = eggButtons.count
        
        if countImage == countButton {
            for i in 0..<countImage {
                result.append(.init(button: eggButtons[i], imageView: eggImageView[i]))
            }
        } else {
            print("Array is nor equal, \(countImage) != \(countButton)")
        }
        return result
    }

}

