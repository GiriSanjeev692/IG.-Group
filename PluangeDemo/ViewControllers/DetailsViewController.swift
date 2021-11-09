//
//  DetailsViewController.swift
//  DetailsViewController
//
//  Created by Sanjeev Kumar on 31/11/09.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    var detailsViewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupTableView()
        setupUI()
    }
    
    private func setupUI() {
        self.title = NavigationTitle.details
        
    }
    
    private func setupTableView() {
        listTableView.separatorStyle = .none
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.register(cellType: DetailsTableViewCell.self)
        listTableView.register(cellType: ProfileTableViewCell.self)
        listTableView.register(cellType: DetailImageTableViewCell.self)
    }
    
    // MARK: - TableView helping methods
    private func getNewsTableViewCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: DetailImageTableViewCell.self)
        cell.configureCell(item: detailsViewModel.newReport)
        return cell
    }
    private func getTrackTableViewCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: DetailsTableViewCell.self)
//        cell.configureCell(title: "Track", desc: detailsViewModel.artist?.trackName)
        return cell
    }
    private func getDescTableViewCell(indexPath: IndexPath, tableView: UITableView, title: String?, desc: String?) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: DetailsTableViewCell.self)
        cell.configureCell(title: title, desc: desc)
        return cell
    }
    private func getProfileTableViewCell(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: ProfileTableViewCell.self)
//        cell.configureCell(item: detailsViewModel.artist)
        return cell
    }

}

// MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return detailsViewModel.getSections()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailsViewModel.getSectionRows(section: section)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = detailsViewModel.rows[indexPath.row]
        switch rowType {
        case .newsImage:
            return getNewsTableViewCell(indexPath: indexPath, tableView: tableView)
        case .description:
            return getDescTableViewCell(indexPath: indexPath, tableView: tableView, title: detailsViewModel.newReport?.title, desc: detailsViewModel.newReport?.specialReportDescription)
        default:
            return UITableViewCell()
        }
        
    }
    
}

// MARK: - UITableViewDelegate
extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(indexPath.row)")
    }
}
