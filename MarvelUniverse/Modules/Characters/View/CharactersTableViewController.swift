//
//  CharactersTableViewController.swift
//  MarvelUniverse
//
//  Created by Mangust on 29.04.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    var output: CharactersViewOutput?
    var isStatusBarHidden = true

    private var characterViewModels = [CharacterViewModel]()
    private var characterDataViewModel: CharacterDataViewModel?
    private var searchController = SearchController(searchResultsController: nil)
    private var isSearching = false
    private var isLoadMore = false

    private lazy var numberOfSections: Int = {
        isLoadMore || isSearching ? 1 : 2
    }()

    private let activityIndicator = UIActivityIndicatorView()

    private enum Constants {
        static let heightForRow: CGFloat = 240
        static let cellIdentifier = "CharacterCell"
        static let heightForFooter: CGFloat = 50
        static let loaderCellIdentifier = "LoaderCell"
        static let alertTitle = "OK"
        static let activityIndicatorHeight = 40
    }

    private enum Sections: Int {
        case characters
        case activityIndicator
    }

    init() {
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var prefersStatusBarHidden: Bool {
        isStatusBarHidden
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewIsReady()

        setupTableView()
        setupSearchView()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard section == Sections.activityIndicator.rawValue else {
            return characterViewModels.count
        }

        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == Sections.activityIndicator.rawValue else {
            let cell: CharacterCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CharacterCell

            let viewModel = characterViewModels[indexPath.row]

            cell.configure(viewModel: viewModel)

            return cell
        }

        let loaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.loaderCellIdentifier, for: indexPath)
        loaderCell.backgroundColor = .clear
        
        activityIndicator.startAnimating()
        loaderCell.addSubview(activityIndicator)
        activityIndicator.isHidden = isSearching

        return loaderCell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == Sections.activityIndicator.rawValue else {
            return Constants.heightForRow
        }

        return isLoadMore && !isSearching ? activityIndicator.bounds.height : .zero
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didTapCell(at: indexPath.row)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height, !isLoadMore, !isSearching {
            if let dataViewModel = characterDataViewModel {
                isLoadMore = dataViewModel.count < dataViewModel.total && !isSearching
            } else {
                isLoadMore = true
            }

            output?.didScrollToEnd()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        layoutActivityIndicator()
    }

    func setupTableView() {
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(
            CharacterCell.self,
            forCellReuseIdentifier: Constants.cellIdentifier
        )
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.loaderCellIdentifier)
        tableView.separatorStyle = .none
    }

    func setupSearchView() {
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = ""
        searchController.isStatusBarHidden = isStatusBarHidden
        searchController.setNeedsStatusBarAppearanceUpdate()
        tableView.tableHeaderView = searchController.searchBar
    }

    private func alert(errorMessage: String, errorTitle: String) {
        let alert = UIAlertController(
            title: errorTitle,
            message: errorMessage,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: Constants.alertTitle, style: .cancel, handler: nil))
        present(alert, animated: false, completion: nil)
    }

    private func layoutActivityIndicator() {
        activityIndicator.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.width.height.equalTo(Constants.activityIndicatorHeight)
        }
    }
}

extension CharactersTableViewController: CharactersViewInput {
    func configureView(viewModels: CharacterDataViewModel) {
        characterDataViewModel = viewModels
        characterViewModels = viewModels.characterViewModels

        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.activityIndicator.stopAnimating()
        }

        if isLoadMore {
            isLoadMore = false
        }
    }

    func showAlert(message: String, title: String) {
        alert(errorMessage: message, errorTitle: title)
    }
}

extension CharactersTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            output?.viewIsReady()
            turnOffSearching()
        } else {
            output?.search(name: searchText)
            turnOnSearching()
        }

        reloadAfterSearching()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        output?.viewIsReady()

        turnOffSearching()
    }

    private func turnOffSearching() {
        isSearching = false
    }

    private func turnOnSearching() {
        isSearching = true
    }

    private func reloadAfterSearching() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
