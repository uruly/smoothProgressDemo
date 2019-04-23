//
//  ViewController.swift
//  SmoothProgress
//
//  Created by Reona Kubo on 2019/04/08.
//  Copyright © 2019 Reona Kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var timerProgressView: UIProgressView!
    @IBOutlet private weak var animateProgressView: UIProgressView!
    private var timer: Timer?
    private var currentProgress: Float = 0
    private var duration: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        timerProgressView.progress = 0
        animateProgressView.progress = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTimer()
        progressAnimation()
    }

    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeProgress(_:)), userInfo: nil, repeats: true)
    }

    private func progressAnimation() {
        UIView.animate(withDuration: TimeInterval(duration), delay: 0, options: .curveLinear, animations: {
            self.animateProgressView.setProgress(1, animated: false)
        }) { (_) in
            print("おわり")
        }
    }

    @objc func changeProgress(_ timer: Timer) {
        timerProgressView.setProgress(currentProgress / Float((duration * 10 - 1)), animated: true)
        currentProgress += 1
    }

}

