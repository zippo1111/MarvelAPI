//
//  CharactersTableViewController.swift
//  MarvelUniverse
//
//  Created by Mangust on 29.04.2022.
//

import UIKit

class CharactersTableViewController: UITableViewController {

    var output: CharactersViewOutput?

    private var characterViewModels = [CharacterViewModel]()
    private var searchController: UISearchController?
    private var isSearching = false
    private var filteredViewModels = [CharacterViewModel]()
    private var isLoadingData = false
    private var isLoadMore = false

    private lazy var numberOfSections: Int = {
        !isLoadMore ? 2 : 1
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        return indicator
    }()

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
            return isSearching ? filteredViewModels.count : characterViewModels.count
        }

        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.section == Sections.activityIndicator.rawValue else {
            let cell: CharacterCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! CharacterCell

            let viewModel = isSearching ?
                filteredViewModels[indexPath.row] :
                characterViewModels[indexPath.row]

            cell.configure(viewModel: viewModel)

            return cell
        }

        let loaderCell = tableView.dequeueReusableCell(withIdentifier: Constants.loaderCellIdentifier, for: indexPath)
        loaderCell.backgroundColor = .clear
        
        activityIndicator.startAnimating()
        loaderCell.addSubview(activityIndicator)

        return loaderCell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section == Sections.activityIndicator.rawValue else {
            return Constants.heightForRow
        }

        return isLoadMore ? activityIndicator.bounds.height : .zero
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output?.didTapCell(at: indexPath.row)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height, !isLoadMore {
            isLoadMore = true
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
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.delegate = self
        searchController?.searchBar.placeholder = ""
        tableView.tableHeaderView = searchController?.searchBar
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
        self.characterViewModels = viewModels.characterViewModels
        isLoadingData = false
        isLoadMore = viewModels.count < viewModels.total

        if isLoadMore {
            isLoadMore = false
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }

    func showAlert(message: String, title: String) {
        alert(errorMessage: message, errorTitle: title)
    }

    func setIsLoadingData() {
        isLoadingData = true
    }
}

extension CharactersTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            filteredViewModels = characterViewModels.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
            isSearching = true
        } else {
            filteredViewModels.removeAll(keepingCapacity: true)
            isSearching = false
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredViewModels.removeAll(keepingCapacity: true)
        isSearching = false
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
