//
//  ViewController.swift
//  SmoothProgress
//
//  Created by Reona Kubo on 2019/04/08.
//  Copyright © 2019 Reona Kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerProgressView: UIProgressView!
    @IBOutlet weak var animateProgressView: UIProgressView!
    var timer: Timer?
    var currentProgress: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        timerProgressView.progress = 0
        animateProgressView.progress = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeProgress(_:)), userInfo: nil, repeats: true)
        UIView.animate(withDuration: 10.0, delay: 0, options: .curveLinear, animations: {
            self.animateProgressView.setProgress(1, animated: true)
        }) { (_) in
            print("おわり")
        }
    }

    @objc func changeProgress(_ timer: Timer) {
        timerProgressView.setProgress(currentProgress / (10 * 10 - 1), animated: true)
        currentProgress += 1
        print("よばれ")
    }


}

