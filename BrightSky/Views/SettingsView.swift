//
//  SettingsView.swift
//  BrightSky
//
//  Created by main on 2023/12/10.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func settingView(_ settingsView: SettingsView, didTap option: SettingOption)
}

final class SettingsView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    weak var delegate: SettingsViewDelegate?
    
    private var viewModel: SettingViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        // we manually set constraint
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(
                equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: SettingViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK : - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.options.count ?? 0
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )
        if let viewModel {
            cell.textLabel?.text = viewModel.options[indexPath.row].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewModel = viewModel else { return }
        let option = viewModel.options[indexPath.row]
        delegate?.settingView(self, didTap: option)
    }
}
