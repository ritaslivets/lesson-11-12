//
//  ViewController.swift
//  lesson 13
//
//  Created by Slivets Margarita on 1.06.26.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    private var sections: [[Setting]] = []
    private var account: Account?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = self
        tableView.register(SettingCell.self, forCellReuseIdentifier: "SettingCell")
        tableView.register(AccountCell.self, forCellReuseIdentifier: "AccountCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemBackground
        setupUI()
        setupData()
        
        
    }
    private func setupData(){
        account = Account(avatar: UIImage(systemName: "person.crop.circle.fill")!, name: "Slivets Margarita", email: "slivets.margarita@gmail.com")
        let section1: [Setting] = [
            Setting(title: "Airplane Mode", image: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, hasSwitsh: true,switchValue: false),
            Setting(title: "Wi-Fi", image: UIImage(systemName: "wifi"), detailText: "Home Wi-Fi 5G", iconBackgroundColor: .systemBlue),
            Setting(title: "Bluetooth", image: UIImage(systemName: "bluetooth"), detailText: "On", iconBackgroundColor: .systemBlue)]
        
        let section3: [Setting] = [
            Setting(title: "Notifications", image: UIImage(systemName: "bell"), iconBackgroundColor: .systemRed),
            Setting(title: "Sounds ", image: UIImage(systemName: "speaker"), iconBackgroundColor: .systemPink),
            Setting(title: "Focus Mode", image: UIImage(systemName: "moon"), detailText: "Do Not Disturb", iconBackgroundColor: .systemIndigo)]
        
        let section2: [Setting] = [
            Setting(title: "General", image: UIImage(systemName: "gearshape"), iconBackgroundColor:.systemGray),
            Setting(title: "Camera", image:UIImage(systemName: "camera") , iconBackgroundColor: .systemGray)]
        
        sections = [section1,section2,section3]
    }
    private func setupUI(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        }
    }

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return sections[section-1].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as? AccountCell, let account = account else { return UITableViewCell()
            }
            cell.configure(with: account)
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as? SettingCell else { return UITableViewCell() }
        let setting = sections[indexPath.section-1][indexPath.row]
        cell.configure(with: setting)
        return cell
    }
}


