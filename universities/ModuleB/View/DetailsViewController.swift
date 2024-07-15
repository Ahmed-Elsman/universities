//
//  DetailsViewController.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit
import WebKit
import Common

class DetailsViewController: UIViewController, DetailsView {

    var presenter: DetailsPresenter?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    private let stateTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "State:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()

    private let stateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()

    private let countryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Country:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()

    private let countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()

    private let codeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Country Code:"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkGray
        return label
    }()

    private let codeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        presenter?.viewDidLoad()
    }

    private func setupView() {
        view.backgroundColor = .white

        // scroll view and content view
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // labels to content view
        contentView.addSubview(nameLabel)
        contentView.addSubview(stateTitleLabel)
        contentView.addSubview(stateLabel)
        contentView.addSubview(countryTitleLabel)
        contentView.addSubview(countryLabel)
        contentView.addSubview(codeTitleLabel)
        contentView.addSubview(codeLabel)

        // Constraints for scroll view and content view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Constraints for labels within content view
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            stateTitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            stateTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stateLabel.topAnchor.constraint(equalTo: stateTitleLabel.bottomAnchor, constant: 5),
            stateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            countryTitleLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 20),
            countryTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryLabel.topAnchor.constraint(equalTo: countryTitleLabel.bottomAnchor, constant: 5),
            countryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            countryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            codeTitleLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20),
            codeTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            codeLabel.topAnchor.constraint(equalTo: codeTitleLabel.bottomAnchor, constant: 5),
            codeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            codeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        // refresh button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonTapped))
    }

    // MARK: - Actions

    @objc private func refreshButtonTapped() {
        presenter?.refreshListingData()
    }

    // MARK: - DetailsView

    func showUniversityDetails(_ university: University) {
        nameLabel.text = university.name
        stateLabel.text = university.country
        countryLabel.text = university.country
        codeLabel.text = university.alphaTwoCode
    }
}
