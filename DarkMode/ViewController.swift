//
//  ViewController.swift
//  DarkMode
//
//  Created by Vladimir Sekerko on 20.09.2022.
//

import UIKit

enum Theme: Int {
    case device
    case light
    case dark
    
    func getUserInterfaceStyle() -> UIUserInterfaceStyle {
        switch self {
        case .device:
            return .unspecified
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

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
        button.tintColor = UIColor(named: "otherColor")
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let likeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.7616526484, green: 0.344427973, blue: 0.4626610279, alpha: 1)
        imageView.tintColor = #colorLiteral(red: 0.7616526484, green: 0.344427973, blue: 0.4626610279, alpha: 1)
        imageView.image = UIImage(named: "like")?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Device", "Light", "Dark"])
        sc.backgroundColor = .white
        sc.selectedSegmentTintColor = #colorLiteral(red: 0.7616526484, green: 0.344427973, blue: 0.4626610279, alpha: 1)
        sc.selectedSegmentIndex = 0
        sc.tintColor = UIColor(named: "otherColor")
        sc.addTarget(self, action: #selector(segmentedControlTapped), for: .valueChanged)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    @objc private func likeButtonTapped() {
        UIView.animate(withDuration: 1) { [weak self] in
            guard let self = self else { return }
            self.likeImageView.tintColor = UIColor(named: "otherColor")
        }
    }
    
    @objc private func segmentedControlTapped() {
        MTUserDefaults.share.theme = Theme(rawValue: segmentedControl.selectedSegmentIndex) ?? .device
        view.window?.overrideUserInterfaceStyle = MTUserDefaults.share.theme.getUserInterfaceStyle()
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        view.addSubview(nameLabel)
        view.addSubview(likeImageView)
        view.addSubview(likeButton)
        view.addSubview(segmentedControl)
        segmentedControl.selectedSegmentIndex = MTUserDefaults.share.theme.rawValue
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

