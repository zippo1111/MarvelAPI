//
//  CharacterDetailsViewController.swift
//  CharacterDetailsViewController
//
//  Created by Mangust on 05.05.2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController {

    var output: CharacterDetailsViewOutput?

    private lazy var detailsView: CharacterDetailsView = {
        let view = CharacterDetailsView(frame: view.frame)
        return view
    }()

    private enum Constants {
        static let cellIdentifier = "CharacterDetailsCell"
    }

    private typealias cellTitles = CharacterDetailsViewModel.TableHeaders

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        output?.viewIsReady()

        setupView()
    }

    func setupView() {
        view.addSubview(detailsView)

        detailsView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewInput {
    func configureView(viewModel: CharacterDetailsViewModel) {
        detailsView.outputBlock?(viewModel)
    }
}
