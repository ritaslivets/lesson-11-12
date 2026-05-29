//
//  thirdViewController.swift
//  lesson 12
//
//  Created by Slivets Margarita on 30.05.26.
//

import UIKit
import SnapKit
class ThirdViewController: UIViewController {
    private let textField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.textColor = .black
        textField.placeholder = "Enter something"
        return textField
    }()
    private let button:UIButton = {
        let button = UIButton()
        button.setTitle("Go back to first page", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private let warninglabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .red
        label.text = "Please enter something"
        label.isHidden = true
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUI()
    }
    
    private func setupUI() {
        self.view.addSubview(textField)
        view.addSubview(warninglabel)
        self.view.addSubview(button)
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        warninglabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
        button.addAction(UIAction { [weak self] _ in
            guard let self = self else { return }
            guard let someText = textField.text, !someText.isEmpty else { self.warninglabel.isHidden = false
                return }
            self.warninglabel.isHidden = true
            self.callback?(someText)
            self.navigationController?.popViewController(animated: true)
        }, for: .touchUpInside)
    }
    var callback : ((String) -> Void)?
    
}
