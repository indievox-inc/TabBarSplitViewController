//
//  ViewController.swift
//  TabBarSplitViewControllerDemo
//
//  Created by Denken on 2/23/16.
//  Copyright © 2016 iNDIEVOX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tag = navigationController?.tabBarItem.tag {
            switch tag {
            case 0:
                title = "Featured"
            case 1:
                title = "Search"
            case 2:
                title = "Favorites"
            default:
                break
            }
        }
        view.backgroundColor = UIColor.whiteColor()

        let redButton = UIButton(type: .System)
        redButton.setTitle("Red", forState: .Normal)
        redButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        redButton.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        redButton.addTarget(self, action: "showRed:", forControlEvents: .TouchUpInside)
        let blueButton = UIButton(type: .System)
        blueButton.setTitle("Blue", forState: .Normal)
        blueButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        blueButton.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        blueButton.addTarget(self, action: "showBlue:", forControlEvents: .TouchUpInside)
        let greenButton = UIButton(type: .System)
        greenButton.setTitle("Green", forState: .Normal)
        greenButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
        greenButton.titleLabel?.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        greenButton.addTarget(self, action: "showGreen:", forControlEvents: .TouchUpInside)

        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        greenButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(redButton)
        view.addSubview(blueButton)
        view.addSubview(greenButton)

        var constraints = [NSLayoutConstraint]()
        let viewsDict = ["redButton": redButton, "blueButton": blueButton, "greenButton": greenButton]
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:[redButton]-30-[blueButton]-30-[greenButton]", options: .DirectionLeadingToTrailing, metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[redButton]|", options: .AlignAllTop, metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[blueButton]|", options: .AlignAllTop, metrics: nil, views: viewsDict)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[greenButton]|", options: .AlignAllTop, metrics: nil, views: viewsDict)
        constraints.append(NSLayoutConstraint(item: blueButton, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0))
        NSLayoutConstraint.activateConstraints(constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions

    func showRed(sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor(red: 0.8, green: 0, blue: 0, alpha: 1.0)
        showViewController(vc, sender: self)
    }

    func showBlue(sender: UIButton) {
        let vc = DetailViewController()
        vc.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0.8, alpha: 1.0)
        showDetailViewController(vc, sender: self)
    }

    func showGreen(sender: UIButton) {
        let vc = DetailViewController()
        vc.view.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0, alpha: 1.0)
        showDetailViewController(vc, sender: self)
    }
}

class EmptyDetailViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = UIColor.darkGrayColor()
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("not selected", comment: "not selected")
        label.textColor = UIColor(white: 1.0, alpha: 0.4)
        label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        view.addSubview(label)
        
        let xConstraint = NSLayoutConstraint(item: label, attribute: .CenterX, relatedBy: .Equal, toItem: view,
            attribute: .CenterX, multiplier: 1.0, constant: 0)
        let yConstraint = NSLayoutConstraint(item: label, attribute: .CenterY, relatedBy: .Equal, toItem: view,
            attribute: .CenterY, multiplier: 1.0, constant: 0)
        NSLayoutConstraint.activateConstraints([xConstraint, yConstraint])
        
        self.view = view
    }
}

class DetailViewController : UIViewController {
}
