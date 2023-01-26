//
//  ViewController.swift
//  EggTimer-Angela-Updated
//
//  Created by Павел Грицков on 24.01.23.
//

import UIKit
import AVFoundation

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
    
    var player: AVAudioPlayer!
    
    // eggs place
    let imagesEgg: [EggImage] = [.soft_egg, .medium_egg, .hard_egg]
    let eggHardness: [EggHardness] = [.soft, .medium, .hard]
    let eggViews: [EggView] = [.init(), .init(), .init()]
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupe()
        setConstraints()
    }
    
    // MARK: - Start setup

    func setupe() {
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        
        let boxForProgressView = UIView()
        boxForProgressView.addSubview(progressView)
        
        // set configuration for EggView
        for (index, view) in eggViews.enumerated() {
            view.configure(
                text: eggHardness[index].rawValue,
                image: UIImage(named: imagesEgg[index].rawValue))

            view.eggButton.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
        }
        
        eggViews.forEach {
            containerStackView.addArrangedSubview($0)
        }
        
        // add view in mainStackView
        [titleLable, containerStackView, boxForProgressView].forEach {
            mainStackView.addArrangedSubview($0)
        }

    }
    
    func setConstraints() {
        
        let boxView = progressView.superview!
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            containerStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -offset),
            containerStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: offset),
        
            progressView.leftAnchor.constraint(equalTo: boxView.leftAnchor, constant: 20),
            progressView.rightAnchor.constraint(equalTo: boxView.rightAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 10),
            progressView.centerYAnchor.constraint(equalTo: boxView.centerYAnchor)])
    }
    
    // MARK: - Methods
    
    @objc func countdownTimer() {
        if totalTimer == secondsPassed {
            timer.invalidate()
            playSound()
            print("DONE!!!!")
        }
        progressView.progress = Float(secondsPassed) / Float(totalTimer)
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
    
    func playSound() {
        let sound = (name: "alarm_sound", type: "mp3")
        guard let path = Bundle.main.path(forResource: sound.name, ofType: sound.type) else { return }
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

}

