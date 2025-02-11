//
//  UniversityCell.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit
import Common

class UniversityCell: UITableViewCell {
    static let identifier = "UniversityCell"

    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .darkGray
        label.numberOfLines = 0
        return label
    }()

    private let stateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right.circle.fill")
        imageView.tintColor = .gray
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(stateLabel)
        containerView.addSubview(arrowImageView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIConstants.containerViewVerticalPadding),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UIConstants.containerViewVerticalPadding),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIConstants.containerViewPadding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIConstants.containerViewPadding),

            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: UIConstants.containerViewVerticalPadding),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: UIConstants.nameLabelLeadingPadding),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImageView.leadingAnchor, constant: -UIConstants.arrowImageViewPadding),

            stateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: UIConstants.containerViewVerticalPadding),
            stateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: UIConstants.nameLabelLeadingPadding),
            stateLabel.trailingAnchor.constraint(lessThanOrEqualTo: arrowImageView.leadingAnchor, constant: -UIConstants.arrowImageViewPadding),
            stateLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -UIConstants.containerViewVerticalPadding),

            arrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -UIConstants.arrowImageViewPadding),
            arrowImageView.leadingAnchor.constraint(greaterThanOrEqualTo: nameLabel.trailingAnchor, constant: UIConstants.arrowImageViewPadding),

            arrowImageView.widthAnchor.constraint(equalToConstant: UIConstants.arrowImageViewWidth),
            arrowImageView.heightAnchor.constraint(equalToConstant: UIConstants.arrowImageViewHeight)
        ])

        nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        arrowImageView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with university: University) {
        nameLabel.text = university.name
        stateLabel.text = university.country
    }
}
