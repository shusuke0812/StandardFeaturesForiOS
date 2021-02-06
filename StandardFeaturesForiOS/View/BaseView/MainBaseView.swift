//
//  MainBaseView.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2020/9/21.
//

import UIKit

class MainBaseView: UIView {
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.registerTableViewCell()
    }
}
// MARK: - Initialized Method
extension MainBaseView {
    func registerTableViewCell() {
        let coreNib = UINib(nibName: "MainCoreViewCell", bundle: nil)
        self.tableView.register(coreNib, forCellReuseIdentifier: "MainCoreViewCell")
        
        let moduleNib = UINib(nibName: "MainModuleViewCell", bundle: nil)
        self.tableView.register(moduleNib, forCellReuseIdentifier: "MainModuleViewCell")
    }
}
