//
//  ViewController.swift
//  CustomNavigationBar
//
//  Created by Viswa Kodela on 6/23/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    // MARK:- Properties
    private let mainVCCellID = "mainVCCellID"
    var navBarHeight: CGFloat = 120
    weak var rightBarButton = CustomButton
    lazy var customNavBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 5)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 10
        view.addSubview(self.rightBarButton!)
        self.addRightBarButtonItem(to: view)
        return view
    }()
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.layer.cornerRadius = 4
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.layer.borderWidth = 0.3
        tv.isScrollEnabled = false
        tv.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        tv.autoresizingMask = .flexibleHeight
        return tv
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SEND", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return button
    }()
    
    class CustomView: UIView {
        override var intrinsicContentSize: CGSize {
            return .zero
        }
    }
    
    lazy var messageView: UIView = {
        let accessoryView = CustomView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        accessoryView.backgroundColor = .white
        accessoryView.translatesAutoresizingMaskIntoConstraints = false
        accessoryView.layer.shadowColor = UIColor.lightGray.cgColor
        accessoryView.layer.shadowRadius = 4
        accessoryView.layer.shadowOpacity = 0.2
        accessoryView.layer.shadowOffset = CGSize(width: 0, height: -8)
//        accessoryView.autoresizingMask = .flexibleHeight
        
        let containerStackView = UIStackView(arrangedSubviews: [self.messageTextView, self.sendButton])
        self.sendButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.axis = .horizontal
        containerStackView.spacing = 8
        containerStackView.isLayoutMarginsRelativeArrangement = true
        containerStackView.alignment = .center
        
        accessoryView.addSubview(containerStackView)
        containerStackView.topAnchor.constraint(equalTo: accessoryView.topAnchor, constant: 4).isActive = true
        containerStackView.leadingAnchor.constraint(equalTo: accessoryView.leadingAnchor, constant: 16).isActive = true
        containerStackView.trailingAnchor.constraint(equalTo: accessoryView.trailingAnchor, constant: -16).isActive = true
        containerStackView.bottomAnchor.constraint(equalTo: accessoryView.bottomAnchor, constant: -5).isActive = true
        
        
        
        
        return accessoryView
    }()
    
    override var inputAccessoryView: UIView? {
        get {
            return messageView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK:- Init
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    // MARK:- Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
        configureLayout()
        
    }

    // MARK:- Helper Methods
    func configureLayout() {
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: mainVCCellID)
        collectionView.keyboardDismissMode = .interactive
        collectionView.contentInset = UIEdgeInsets(top: navBarHeight - 20, left: 0, bottom: 10, right: 0)
        
        configureNavBar()
    }
    
    func configureNavBar() {
        view.addSubview(customNavBar)
        customNavBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        customNavBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        customNavBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        customNavBar.heightAnchor.constraint(equalToConstant: navBarHeight).isActive = true
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    func addRightBarButtonItem(to customNavBar: UIView) {
        
        self.rightBarButton?.layer.cornerRadius = 22
        self.rightBarButton?.clipsToBounds = true
        self.rightBarButton?.bottomAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: -20).isActive = true
        self.rightBarButton?.widthAnchor.constraint(equalToConstant: 44).isActive = true
        self.rightBarButton?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        self.rightBarButton?.trailingAnchor.constraint(equalTo: customNavBar.trailingAnchor, constant: -20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    // MARK:- CollectionView Delegate and Datasource methods
extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainVCCellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = DetailsViewController()
        navigationController?.pushViewController(detailController, animated: true)
    }
    
}



