//
//  ViewController.swift
//  Xylophone
//
//  Created by murad on 19.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    
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
            let containerView = setupContainerView()
            
            mainVerticalStackView.addArrangedSubview(containerView)
            containerView.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: containerView.topAnchor),
                button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: spaceConstraintEdgeButton),
                button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -spaceConstraintEdgeButton),
                button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
            
            spaceConstraintEdgeButton += 5
        }
    }
    
    private func setupContainerView() -> UIView {
        let uiView = UIView()
        uiView.backgroundColor = .systemBackground
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }
}

