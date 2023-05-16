//
//  ViewController.swift
//  Day6
//
//  Created by Ilya Krupko on 16.05.23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var blueBox: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 80, height: 80)))
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
        view.center = self.view.center
        return view
    }()
    
    lazy var dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    lazy var snapBehavior = UISnapBehavior(item: blueBox, snapTo: view.center)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        view.addSubview(blueBox)
        
        dynamicAnimator.addBehavior(snapBehavior)
    }
    
    @objc func onTap(_ sender: UITapGestureRecognizer) {
        snapBehavior.snapPoint = sender.location(in: nil)
    }
}

