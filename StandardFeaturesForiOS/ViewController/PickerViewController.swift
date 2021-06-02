//
//  PickerViewController.swift
//  StandardFeaturesForiOS
//
//  Created by Shusuke Ota on 2021/6/2.
//

import UIKit

/// Pickerの種類
enum PickerType {
    case rank
    case config
    case timer
}

class PickerViewController: UIViewController {
    
    @IBOutlet weak var rankSelectButton: UIButton!
    @IBOutlet weak var configButton: UIButton!
    @IBOutlet weak var timerSelectTextField: UITextField!
    
    var pickerWithDoneButtonView = UIView()
    
    let dataList = [ "やさしい", "ふつう", "むずかしい", "かなりむずかしい" ]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Action
    @IBAction func didTapRankSelectButton(_ sender: Any) {
        self.createPickerWithDoneButtonView()
    }
    @IBAction func didTapConfigButton(_ sender: Any) {
    }
    @IBAction func didTapTimerSelectTextField(_ sender: Any) {
    }
}
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(self.dataList[row])
    }
    private func createPickerWithDoneButtonView() {
        // Picker, ToolBarの高さ
        let pickerViewHeight = CGFloat(180)
        let toolBarHeight = CGFloat(40)
        let pickeWithDoneButtonViewHeight = pickerViewHeight + toolBarHeight
        // Picker + 閉じるボタン付きToolBar をグルーピングするBaseView
        self.pickerWithDoneButtonView.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: pickeWithDoneButtonViewHeight)
        self.pickerWithDoneButtonView.backgroundColor = .white
        
        // ToolBar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.pickerWithDoneButtonView.frame.width, height: toolBarHeight))
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.didTapDoneButton))
        // [spaceItem, doneItem] の順で `doneボタン` が右に配置
        toolBar.setItems([spaceItem, doneItem], animated: true)
        
        self.pickerWithDoneButtonView.addSubview(toolBar)
        
        // Picker
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: toolBarHeight, width: self.pickerWithDoneButtonView.frame.width, height: pickerViewHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerWithDoneButtonView.addSubview(pickerView)
        
        self.view.addSubview(self.pickerWithDoneButtonView)
    }
    @objc private func didTapDoneButton() {
        self.pickerWithDoneButtonView.removeFromSuperview()
        self.pickerWithDoneButtonView = UIView()
    }
}
