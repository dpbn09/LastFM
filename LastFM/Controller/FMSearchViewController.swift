//
//  FMSearchViewController.swift
//  LastFM
//
//  Created by Deepanshu Bansal on 08/09/20.
//  Copyright © 2020 Deepanshu Bansal. All rights reserved.
//

import UIKit

class FMSearchViewController: UIViewController {

    @IBOutlet weak var resultTableView: UITableView!
    
    private var viewModel: SearchViewModel!
    private var textToSearch = ""
    private var selectedOption:Selection = Selection.Unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func initializeController() {
        title = "Records"
        
        viewModel = SearchViewModel(delegate: self)
        
        resultTableView.register(UINib(nibName: FileNameIdentifiers.CustomTableViewCell, bundle: Bundle.main), forCellReuseIdentifier: CellIdentifiers.SearchCell)
        resultTableView.register(UINib(nibName: FileNameIdentifiers.CustomSectionHeaderView, bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: CellIdentifiers.CustomSectionHeader)
        resultTableView.dataSource = self
        resultTableView.delegate = self
        resultTableView.separatorColor = UIColor.gray
        resultTableView.tableFooterView = UIView(frame: .zero)
        resultTableView.rowHeight = UITableView.automaticDimension
        resultTableView.estimatedRowHeight = 300
    }
}


extension FMSearchViewController: SearchViewDelegate {
    func searchButtonTapped(with searchText: String) {
        textToSearch = searchText
        viewModel.reset()
        viewModel.fetchData(selection: selectedOption, searchText: textToSearch)
    }
}

extension FMSearchViewController: SelectionViewDelegate {
    func buttonSelected(selection: Selection) {
        selectedOption = selection
        viewModel.reset()
        viewModel.fetchData(selection: selectedOption, searchText: textToSearch)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textToSearch = textField.text ?? ""
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}

extension FMSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = self.resultTableView.dequeueReusableHeaderFooterView(withIdentifier: CellIdentifiers.CustomSectionHeader) as! CustomSectionHeaderView
        if header.searchView.delegate == nil {
            header.searchView.setDelegate(delegate: self)
        }
        if header.selectionView.delegate == nil {
            header.selectionView.setDelegate(delegate: self)
        }
        selectedOption = header.selectionView.getSelectedOption()
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.SearchCell, for: indexPath) as? CustomTableViewCell
        cell?.selectionStyle = .none
        let (title, url) = viewModel.data(at: indexPath.row)
        cell?.configure(title: title, url: url)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.currentCount - 1 {
            viewModel.fetchData(selection: selectedOption, searchText: textToSearch)
        }
    }
}

extension FMSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRow(at: indexPath.row)
    }
}

extension FMSearchViewController: SearchViewModelDelegate {
    
    func onFetchCompleted() {
        resultTableView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: "Warning" , message: reason, actions: [action])
    }
    
    func navigateToDetailsViewController(data: Any, selection: Selection) {
        if let detailsVC: FMDetailViewController = UIStoryboard.instantiateVC(forModule: .Main) {
            detailsVC.data = data
            detailsVC.selectedOption = selection
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

extension FMSearchViewController: AlertDisplayer {
}
