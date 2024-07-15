//
//  ListingViewController.swift
//  universities
//
//  Created by Ahmed Elsman on 14/07/2024.
//

import UIKit

class ListingViewController: UIViewController, ListingView {
    var presenter: ListingPresenter?
    private var universities: [University] = []
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }

    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UniversityCell.self, forCellReuseIdentifier: UniversityCell.identifier)
        view.addSubview(tableView)
    }

    func showUniversities(_ universities: [University]) {
        self.universities = universities
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func showError(_ error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

extension ListingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UniversityCell.identifier, for: indexPath) as? UniversityCell else {
            return UITableViewCell()
        }
        cell.configure(with: universities[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectUniversity(universities[indexPath.row])
    }
}
