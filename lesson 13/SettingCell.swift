import UIKit
import SnapKit

class SettingCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    private let settingSwitch: UISwitch = {
        let switchView = UISwitch()
        switchView.isHidden = true
        return switchView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setUpUI() {
        self.addSubview(titleLabel)
        self.addSubview(detailLabel)
        self.addSubview(settingSwitch)
        self.addSubview(iconContainer)
        iconContainer.addSubview(iconView)
        
        iconContainer.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
        }
        
        iconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(18)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconContainer.snp.trailing).offset(12)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-15)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(10)
        }
        
        settingSwitch.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
        }
    }
    
    func configure(with setting: Setting) {
        titleLabel.text = setting.title
        iconView.image = setting.image?.withRenderingMode(.alwaysTemplate)
        iconContainer.backgroundColor = setting.iconBackgroundColor
        iconView.tintColor = .white
        
        if let detailText = setting.detailText {
            detailLabel.text = detailText
            settingSwitch.isHidden = true
            detailLabel.isHidden = false
        } else if setting.hasSwitsh {
            detailLabel.isHidden = true
            settingSwitch.isHidden = false
            settingSwitch.isOn = setting.switchValue
        } else {
            detailLabel.isHidden = true
            settingSwitch.isHidden = true
        }
    }
}

