//
//  LoadingButton.swift
//  TuistSample2
//
//  Created by sato.k on 2020/09/03.
//  Copyright © 2020 dely.jp. All rights reserved.
//

import UIKit

open class LoadingButton: UIButton {

    open override var state: UIControl.State {
        return isLoading ? .reserved : super.state
    }

    open var isLoading: Bool = false {
        didSet {
            if isLoading {
                indicatorView.startAnimating()
            } else {
                indicatorView.stopAnimating()
            }
            setNeedsLayout()
            layoutIfNeeded()
        }
    }

    public let indicatorView: UIActivityIndicatorView = {
        let style: UIActivityIndicatorView.Style
        if #available(iOS 13, *) {
            style = .medium
        } else {
            style = .white
        }
        return UIActivityIndicatorView(style: style)
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setImage(nil, for: .reserved)
        setTitle("", for: .reserved)
        setAttributedTitle(nil, for: .reserved)

        addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            indicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if isLoading {
            return false
        } else {
            return super.beginTracking(touch, with: event)
        }
    }

}
