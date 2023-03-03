//
//  ModuleBViewController.swift
//  modularized_app_a
//
//  Created by Anton Aleksieiev on 06.01.2023.
//

import UIKit
import SnapKit
import modularized_shared_module
import modularized_module_b_details

public protocol ModuleBViewControllerDelegate: AnyObject {
    func moduleBDidSelectItem(with ID: SharedDisplayItemIdentifier)
}

public class ModuleBViewController: UIViewController {
    
    let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), style: .plain)
    
    var items: [SharedDisplayItem]
    var selectedID: UUID?
    public weak var delegate: ModuleBViewControllerDelegate?

    public init(items: [SharedDisplayItem], selectedID: UUID? = nil) {
        self.items = items
        self.selectedID = selectedID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SharedTableViewCell.self, forCellReuseIdentifier: SharedTableViewCell.reuseIdentifier)

        tableView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
}

extension ModuleBViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SharedTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? SharedTableViewCell else {
            return UITableViewCell()
        }
        let item = items[indexPath.row]
        cell.update(with: item, selected: selectedID == item.id, selectedColor: .systemGreen)
        return cell
    }
}

extension ModuleBViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        var indexPathesToReload = [indexPath]
        if let selectedID, let selectedIdx = items.firstIndex(where: { $0.id == selectedID }) {
            indexPathesToReload.append(IndexPath(row: selectedIdx, section: 0))
        }
        print("Dast ist shiiiiii")
        self.selectedID = item.id
        self.tableView.reloadRows(at: indexPathesToReload, with: .automatic)
        
        self.delegate?.moduleBDidSelectItem(with: item.id)
        
        let detailsVC = DetailsViewController(item: item)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
