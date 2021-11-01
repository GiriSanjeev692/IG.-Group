//
//  ViewController.swift
//  PluangeDemo
//
//  Created by Sanjeev Kumar on 31/10/21.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupTableView()
        fetchData()
    }

    private func setupView() {
        self.title = NavigationTitle.home
    }
    private func setupTableView() {
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(cellType: HomeTableViewCell.self)
    }
    private func pushDetailVC() {
        let detailVC = DetailsViewController.instantiate(fromAppStoryboard: .main)
        detailVC.detailsViewModel.artist = homeViewModel.selectedObject
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - Network Calls
    private func fetchData() {
        homeViewModel.fetchRepoList() { [weak self] result in
            switch result {
            case .success(_):
                self?.listTableView.reloadData()
            case .failure(_):
                print("Api call failled")
            }
        }
    }
    
    // MARK: - TableView helping methods
    private func getHomeTableViewCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = listTableView.dequeueReusableCell(cellType: HomeTableViewCell.self)
        cell.configureCell(item: homeViewModel.repoList[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return homeViewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.numberOfRowsForSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getHomeTableViewCell(indexPath: indexPath, tableView: tableView)
    }
    
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeViewModel.selectedObject = homeViewModel.repoList[indexPath.row]
        pushDetailVC()
    }
}
