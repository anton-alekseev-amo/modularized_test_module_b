//
//  ModuleATableViewCell.swift
//  modularized_app_a
//
//  Created by Anton Aleksieiev on 06.01.2023.
//

import UIKit

class ModuleBTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "ModuleBTableViewCell"
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        subtitleLabel.textAlignment = .right
        subtitleLabel.textColor = .black
        subtitleLabel.numberOfLines = 1
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subtitleLabel)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -8),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            subtitleLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8),
            subtitleLabel.bottomAnchor.constraint(greaterThanOrEqualTo: bottomAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(withTitle title: String, subtitle: String, selected: Bool) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.backgroundColor = selected ? .systemGreen : .white
    }
}
