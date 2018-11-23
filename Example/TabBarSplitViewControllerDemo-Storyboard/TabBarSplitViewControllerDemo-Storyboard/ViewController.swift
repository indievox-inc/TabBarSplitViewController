//
//  ViewController.swift
//  TabBarSplitViewControllerDemo
//
//  Created by Denken on 2/23/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let secondaryWithNav : Bool

    init(secondaryWithNav: Bool) {
        self.secondaryWithNav = secondaryWithNav
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        self.secondaryWithNav = true
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tag = navigationController?.tabBarItem.tag {
            switch tag {
            case 1:
                title = "Featured"
            case 2:
                title = "Search"
            case 3:
                title = "Favorites"
            default:
                break
            }
        }
        view.backgroundColor = .white

        let redButton = UIButton(type: .system)
        redButton.setTitle("Red (showViewController)", for: .normal)
        redButton.setTitleColor(.red, for: .normal)
        redButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        redButton.addTarget(self, action: #selector(showRed), for: .touchUpInside)
        let blueButton = UIButton(type: .system)
        blueButton.setTitle("Blue (showDetailViewController)", for: .normal)
        blueButton.setTitleColor(.blue, for: .normal)
        blueButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        blueButton.addTarget(self, action: #selector(showBlue), for: .touchUpInside)
        let greenButton = UIButton(type: .system)
        greenButton.setTitle("Green (showDetailViewController)", for: .normal)
        greenButton.setTitleColor(.green, for: .normal)
        greenButton.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        greenButton.addTarget(self, action: #selector(showGreen), for: .touchUpInside)
        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)

        var constraints = [NSLayoutConstraint]()
        let viewsDict = ["redButton": redButton, "blueButton": blueButton, "greenButton": greenButton]
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:[redButton]-30-[blueButton]-30-[greenButton]", options: .directionLeadingToTrailing, metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[redButton]|", options: .alignAllTop, metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[blueButton]|", options: .alignAllTop, metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|[greenButton]|", options: .alignAllTop, metrics: nil, views: viewsDict)
        constraints.append(NSLayoutConstraint(item: blueButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0))
        NSLayoutConstraint.activate(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions

    @objc func showRed(_ sender: UIButton) {
        let vc = ViewController(secondaryWithNav: secondaryWithNav)
        vc.title = "Red"
        vc.view.backgroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 1.0)
        show(vc, sender: self)
    }

    @objc func showBlue(_ sender: UIButton) {
        let vc = DetailViewController(secondaryWithNav: secondaryWithNav)
        vc.title = "Blue"
        vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 1.0)
        switch secondaryWithNav {
        case true:
            let nav = UINavigationController(rootViewController: vc)
            showDetailViewController(nav, sender: self)
        case false:
            showDetailViewController(vc, sender: self)
        }
    }

    @objc func showGreen(_ sender: UIButton) {
        let vc = DetailViewController(secondaryWithNav: secondaryWithNav)
        vc.title = "Green"
        vc.view.backgroundColor = UIColor(red: 0, green: 0.5, blue: 0, alpha: 1.0)
        switch secondaryWithNav {
        case true:
            let nav = UINavigationController(rootViewController: vc)
            showDetailViewController(nav, sender: self)
        case false:
            showDetailViewController(vc, sender: self)
        }
    }
}

class EmptyDetailViewController : UIViewController {

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .darkGray
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("not selected", comment: "not selected")
        label.textColor = UIColor(white: 1.0, alpha: 0.4)
        label.font = .preferredFont(forTextStyle: .headline)
        view.addSubview(label)
        
        let xConstraint = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: view,
            attribute: .centerX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: view,
            attribute: .centerY, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activate([xConstraint, yConstraint])
        
        self.view = view
    }
}

class DetailViewController : ViewController {
}
