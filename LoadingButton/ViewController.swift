//
//  ViewController.swift
//  LoadingButton
//
//  Created by sato.k on 2020/09/04.
//  Copyright © 2020 kei.johnney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: LoadingButton!
    @IBOutlet weak var button2: LoadingButton!
    @IBOutlet weak var button3: LoadingButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        button1.indicatorView.style = .white
        button2.indicatorView.style = .gray
        button3.indicatorView.style = .gray
        button3.indicatorView.color = .systemBlue
    }

    @IBAction func didTapRightBarButton(_ sender: Any) {
        [button1, button2, button3].forEach { $0?.isLoading.toggle() }
    }


}

