//
//  FirstViewController 2.swift
//  lesson 12
//
//  Created by Slivets Margarita on 30.05.26.
//


import UIKit
import SnapKit
class FirstViewControllerTwo: UIViewController {
    func goBackToFirstPage(title: String) {
        self.label.text = title
    }
    
    private let label:UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .black
        return label
    }()
    private let button:UIButton = {
        let button = UIButton()
        button.setTitle("Go to second", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupUI()
        setupActions()
    }
    private func setupUI() {
        self.view.addSubview(label)
        self.view.addSubview(button)
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
        }
    }
    private func setupActions() {
        button.addAction(UIAction { [weak self] _ in
            let VC = ThirdViewController()
            VC.callback = { [ weak self] text  in
                self?.label.text = text}
            self?.navigationController?.pushViewController(VC, animated: true)
        }, for: .touchUpInside)
    }
}
