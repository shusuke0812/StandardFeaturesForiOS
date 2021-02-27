//
//  ContactViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/2/27.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
// MARK: - Private Method
extension ContactViewController {
    func openMail() {
        // メールが送信できるか確認
        guard MFMailComposeViewController.canSendMail() else { return }
        // メール作成
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        // 宛先
        mailCompose.setToRecipients(["to_sample1@sample.com", "to_sample2@sample.com"])
        mailCompose.setCcRecipients(["cc_sample3@sample.com"])
        mailCompose.setBccRecipients(["bcc_sample4@sample.com"])
        // 件名
        mailCompose.setSubject("サンプル件名")
        // 本文
        mailCompose.setMessageBody("これはサンプルメールです", isHTML: false)
        self.present(mailCompose, animated: true, completion: nil)
    }
}
// MARK: - MFMaileComposeViewController Delegate Method
extension ContactViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let error = error {
            print("DEBUG: Mail Error \(error)")
            return
        }
        switch result {
        case .cancelled:
            print("DEBUG: キャンセル")
        case .saved:
            print("DEBUG: 下書き保存")
        case .sent:
            print("DEBUG: 送信成功")
        case .failed:
            print("DEBUG: 送信失敗")
        @unknown default:
            fatalError(error.debugDescription)
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
