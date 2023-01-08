//
//  DetailsViewController.swift
//  modularized_module_b
//
//  Created by Anton Aleksieiev on 08.01.2023.
//

import UIKit
import modularized_shared_module

public class DetailsViewController: UIViewController {
    
    let titleLabel = UILabel()
    let detailsLabel = UILabel()
    
    let item: SharedDisplayItem
    
    public init(item: SharedDisplayItem) {
        self.item = item
        super.init(nibName: nil, bundle: .moduleBDetails)
        [titleLabel, detailsLabel].forEach(view.addSubview)
        setupTitle()
        setupDetails()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleLabel.text = item.title
        detailsLabel.text = item.subtitle
    }
    
    private func setupTitle() {
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 20)
        
        titleLabel.snp.makeConstraints { make in
            let safeArea = view.safeAreaLayoutGuide
            make.centerX.equalTo(safeArea.snp.centerX)
            make.top.equalTo(safeArea.snp.top).offset(40)
            make.left.right.equalToSuperview().inset(40)
        }
    }
    
    private func setupDetails() {
        detailsLabel.numberOfLines = 0
        detailsLabel.textAlignment = .center
        detailsLabel.font = .systemFont(ofSize: 16)
        
        detailsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(40)
        }
    }

}
