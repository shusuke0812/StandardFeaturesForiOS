//
//  UILabel+Extension.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//

import UIKit

extension UILabel {
    /// 長押しタップでテキストをコピー
    internal func tapCopy() {
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture)))
    }
    /// 長押しした時の処理
    @objc private func handleLongPressGesture(recognizer: UIGestureRecognizer) {
        self.becomeFirstResponder()
        let contextMenu = UIMenuController.shared
        if contextMenu.isMenuVisible {
            contextMenu.showMenu(from: recognizer.view?.superview, rect: recognizer.view?.frame)
        }
    }
    open override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy)
    }
    open override func copy(_ sender: Any?) {
        UIPasteboard.general.string = text
    }
}
