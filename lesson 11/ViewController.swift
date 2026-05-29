//
//  ViewController.swift
//  lesson 11
//
//  Created by Slivets Margarita on 29.05.26.
import UIKit
import SnapKit
class ViewController: UIViewController {
    
        private let  stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillEqually
            //stackView.alignment = .center
            stackView.spacing = 12
            //stackView.backgroundColor = .black
            return stackView
        }()
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 64, weight: .light)
        label.textColor = .white
        label.backgroundColor = .black
        return label
    }()
    
    func setUp(){
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(420)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            
            view.addSubview(resultLabel)
            resultLabel.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                make.height.equalTo(120)}
        }
    }
    
    
    struct CustomButtonStyle {
        let textColor: UIColor
        let backgroundColor: UIColor
        static let number = CustomButtonStyle(textColor: .white, backgroundColor: .color)
       static  let operation = CustomButtonStyle(textColor: .white, backgroundColor:.color1 )
        static let function = CustomButtonStyle(textColor: .white, backgroundColor:.color )
    }
    
    
        class customButtom: UIButton {
            init(title: String, style: CustomButtonStyle, onTap: @escaping() -> Void){ super.init(frame: .zero)
                setTitle(title, for: .normal)
                setTitleColor(style.textColor, for: .normal)
                titleLabel?.font = .systemFont(ofSize: 32, weight: .medium)
                backgroundColor = style.backgroundColor
               // layer.cornerRadius = 40
                clipsToBounds = true
                addAction(UIAction {_ in onTap() }, for: .touchUpInside)
                }
            override var intrinsicContentSize: CGSize {
                return CGSize(width: 80, height: 80)
            }
            override func layoutSubviews(){
                super.layoutSubviews()
                layer.cornerRadius = bounds.height / 2
                }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    private func createButton() -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = UIColor(named: "Color")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32, weight: .medium)
        return button
    }
    
    
    private func createRow(buttons: [(title: String, style: CustomButtonStyle)]) -> UIStackView {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.distribution = .fill
        rowStackView.spacing = 12
        for buttonData in buttons {
            let button = customButtom(title: buttonData.title, style: buttonData.style) { }
            button.snp.makeConstraints { make in
                make.width.height.equalTo(80)
            }
            rowStackView.addArrangedSubview(button)
            
        }
        
        return rowStackView
    }
    
    private func createLastRow () -> UIStackView {
        let rowStackView = UIStackView()
        rowStackView.axis = .horizontal
        rowStackView.distribution = .fillEqually
        rowStackView.spacing = 12
        let calcButton = customButtom(title: " ", style: .function) { }
        calcButton.setImage(UIImage(systemName: "calculator"), for: .normal)
        calcButton.imageView?.contentMode = .scaleAspectFit
        calcButton.setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(pointSize: 30, weight: .medium),
            forImageIn: .normal
        )
            calcButton.tintColor = .white
        let zeroButton = customButtom(title: "0", style: .number) { }
        let dotButton = customButtom(title: ",", style: .number) { }
        let equalButton = customButtom(title: "=", style: .operation) { }
        rowStackView.addArrangedSubview(calcButton)
        rowStackView.addArrangedSubview(zeroButton)
        rowStackView.addArrangedSubview(dotButton)
        rowStackView.addArrangedSubview(equalButton)
        return rowStackView
    }
    
    
    private func createButtonRows() {
        let row1 = createRow(buttons: [("AC", .function), ("+/-", .function), ("%", .function), ("÷", .operation)])
        let row2 = createRow(buttons: [("7", .number), ("8",.number), ("9", . number), ("×", .operation)])
        let row3 = createRow(buttons: [("4", .number), ("5", .number), ("6", . number), ("-", .operation)])
        let row4 = createRow(buttons: [("1",.number), ("2", .number), ("3",.number), ("+", .operation)])
        let row5 = createLastRow()
        stackView.addArrangedSubview(row1)
        stackView.addArrangedSubview(row2)
        stackView.addArrangedSubview(row3)
        stackView.addArrangedSubview(row4)
        stackView.addArrangedSubview(row5)
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            setUp()
            view.backgroundColor = .black
            createButtonRows()
            
        }
        
    
}


