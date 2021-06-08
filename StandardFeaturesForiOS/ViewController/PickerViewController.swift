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
    
    func pickerComponents() -> [String] {
        switch self {
        case .rank:     return [ "やさしい", "ふつう", "むずかしい", "かなりむずかしい" ]
        case .config:   return [ "省電力", "ふつう", "ハイパワー" ]
        case .timer:    return [ "9:00", "18:00" ]
        }
    }
}

class PickerViewController: UIViewController {
    
    // MARK: - Property
    @IBOutlet weak var rankSelectButton: UIButton!
    @IBOutlet weak var configButton: UIButton!
    @IBOutlet weak var timerSelectTextField: UITextField!
    
    var pickerWithDoneButtonView = UIView()
    private var isDisplayedpickerType: PickerType!
    private var isLoadPickerView = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timerSelectTextField.delegate = self
    }
    // MARK: - Action
    @IBAction func didTapRankSelectButton(_ sender: Any) {
        self.setPickerView(pickerType: .rank)
    }
    @IBAction func didTapConfigButton(_ sender: Any) {
        self.setPickerView(pickerType: .config)
    }
    @IBAction func didTapTimerSelectTextField(_ sender: Any) {
        self.setPickerView(pickerType: .timer)
    }
    private func setPickerView(pickerType: PickerType) {
        if !self.pickerWithDoneButtonView.isHidden {
            self.isDisplayedpickerType = pickerType
            self.createPickerWithDoneButtonView()
            self.pickerWithDoneButtonView.isHidden = false
        }
    }
}
// MARK: - Private
extension PickerViewController {
}
// MARK: - TextField Delegate
extension PickerViewController: UITextFieldDelegate {
}
// MARK: - PickerView Delegate
extension PickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.isDisplayedpickerType.pickerComponents().count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.isDisplayedpickerType.pickerComponents()[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       print(self.isDisplayedpickerType.pickerComponents()[row])
    }
    private func createPickerWithDoneButtonView() {
        // Picker, ToolBarの高さ
        let pickerViewHeight = CGFloat(180)
        let toolBarHeight = CGFloat(40)
        let pickeWithDoneButtonViewHeight = pickerViewHeight + toolBarHeight
        // Picker + 閉じるボタン付きToolBar をグルーピングするBaseView
        self.pickerWithDoneButtonView.frame = CGRect(x: 0, y: self.view.frame.height / 2, width: self.view.frame.width, height: pickeWithDoneButtonViewHeight)
        
        // ToolBar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.pickerWithDoneButtonView.frame.width, height: toolBarHeight))
        toolBar.barTintColor = .systemGray5
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(title: "閉じる", style: .done, target: self, action: #selector(self.didTapDoneButton))
        // [spaceItem, doneItem] の順で `doneボタン` が右に配置
        toolBar.setItems([spaceItem, doneItem], animated: true)
        
        self.pickerWithDoneButtonView.addSubview(toolBar)
        
        // Picker
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: toolBarHeight, width: self.pickerWithDoneButtonView.frame.width, height: pickerViewHeight))
        pickerView.backgroundColor = .systemGray5
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.pickerWithDoneButtonView.addSubview(pickerView)
        
        self.view.addSubview(self.pickerWithDoneButtonView)
    }
    @objc private func didTapDoneButton() {
        self.pickerWithDoneButtonView.removeFromSuperview()
        self.pickerWithDoneButtonView = UIView()
        self.isLoadPickerView = false
    }
}
