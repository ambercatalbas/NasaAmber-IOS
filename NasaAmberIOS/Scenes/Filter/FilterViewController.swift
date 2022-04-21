//
//  FilterViewController.swift
//  NasaAmberIOS
//
//  Created by AMBER ÇATALBAŞ on 20.04.2022.
//

import UIKit

protocol FilterViewControllerProtocol {
  func selectedItem(item: String)
}

final class FilterViewController: BaseViewController<FilterViewModel> {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TitleCell.self)
        return tableView
    }()
    
    private let backButton = UIButtonBuilder()
        .image(.icClose)
        .backgroundColor(.clear)
        .tintColor(.appCinder)
        .build()
    var delegate: FilterViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
    }
 
}

// MARK: - UILayout
extension FilterViewController {
    
    private func addSubViews() {
        addBackButton()
        addTableView()
    }
    
    private func addBackButton() {
        view.addSubview(backButton)
        backButton.leftToSuperview().constant = 20
        backButton.topToSuperview(usingSafeArea: true)
        backButton.height(40)
        
    }
    
    private func addTableView() {
        view.addSubview(tableView)
        tableView.topToBottom(of: backButton).constant = 10
        tableView.leftToSuperview()
        tableView.rightToSuperview()
        tableView.bottomToSuperview(usingSafeArea: true)
    }
    

}

// MARK: - Configure and Set Localize
extension FilterViewController {
    
    private func configureContents() {
        title = L10n.Filter.title
        tableView.dataSource = self
        tableView.delegate = self
        backButton.addTarget(self, action: #selector(dismisScene), for: .touchUpInside)
    }

    
}

// MARK: - Actions
extension FilterViewController {
    
    @objc
    private func dismisScene() {
        viewModel.dismissScene()
    }
}
// MARK: - UITableViewDataSource
extension FilterViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TitleCell = tableView.dequeueReusableCell(for: indexPath)
        let cellItem = viewModel.items[indexPath.row]
        cell.set(viewModel: TitleCellModel(title: cellItem))
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedItem(item: viewModel.items[indexPath.row])
        viewModel.dismissScene()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
