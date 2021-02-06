//
//  UILabel+Extension.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/22.
//

import UIKit

class TapCopyUILabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTapCopy()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setTapCopy()
    }
}
// MARK: - Custom Method
extension TapCopyUILabel {
    override var canBecomeFirstResponder: Bool { return true }
    /// 長押しタップでテキストをコピー
    func setTapCopy() {
        self.isUserInteractionEnabled = true
        addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:))))
    }
    /// 長押しした時の処理
    @objc func handleLongPressGesture(_ recognizer: UIGestureRecognizer) {
        if let recognizerView: UIView = recognizer.view, let recognizerSuperView: UIView = recognizerView.superview, recognizerView.becomeFirstResponder() {
            let menuController: UIMenuController = UIMenuController.shared
            menuController.showMenu(from: recognizerSuperView, rect: recognizerView.frame)
        }
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return action == #selector(UIResponderStandardEditActions.copy)
    }
    override func copy(_ sender: Any?) {
        UIPasteboard.general.string = text
    }
}
