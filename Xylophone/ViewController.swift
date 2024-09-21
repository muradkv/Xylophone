//
//  ViewController.swift
//  Xylophone
//
//  Created by murad on 19.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        return stackView
    }()
    
    var player: AVAudioPlayer?
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    //MARK: - SetupUI
    
    private func setupUI() {
        view.addSubview(mainVerticalStackView)
        view.backgroundColor = .systemBackground
        
        setupButtons()
        
        NSLayoutConstraint.activate([
            mainVerticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainVerticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainVerticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    private func setupButtons() {
        
        var spaceConstraintEdgeButton: CGFloat = 5
        
        for key in XylophoneData.keys {
            let button = CustomButton(backgroundColor: key.color, title: key.title)
            
            mainVerticalStackView.addArrangedSubview(button)
            
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: mainVerticalStackView.leadingAnchor, constant: spaceConstraintEdgeButton),
                button.trailingAnchor.constraint(equalTo: mainVerticalStackView.trailingAnchor, constant: -spaceConstraintEdgeButton)
            ])
            
            button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
            
            spaceConstraintEdgeButton += 5
        }
    }
    
    //MARK: - Methods
    
    @objc private func playSound(sender: UIButton) {
        if let customButton = sender as? CustomButton {
            customButton.animateButton()
        }
        
        guard let titleButton = sender.titleLabel?.text else { return }
        guard let path = Bundle.main.path(forResource: titleButton, ofType:"wav") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

