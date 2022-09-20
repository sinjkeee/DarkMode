//
//  ViewController.swift
//  DarkMode
//
//  Created by Vladimir Sekerko on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test App with dark mode"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textColor = #colorLiteral(red: 0.7616526484, green: 0.344427973, blue: 0.4626610279, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press Me", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.7616526484, green: 0.344427973, blue: 0.4626610279, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7616526484, green: 0.344427973, blue: 0.4626610279, alpha: 1)
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl()
        sc.backgroundColor = .red
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc private func likeButtonTapped() {
        likeImageView.image = UIImage(named: "like")
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(likeImageView)
        view.addSubview(likeButton)
        view.addSubview(segmentedControl)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            likeImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 100),
            likeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            likeImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            likeButton.topAnchor.constraint(equalTo: likeImageView.bottomAnchor, constant: 20),
            likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            likeButton.widthAnchor.constraint(equalTo: likeImageView.widthAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            
            segmentedControl.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 50),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

