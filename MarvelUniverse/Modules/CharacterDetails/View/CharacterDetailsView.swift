//
//  CharacterDetailsView.swift
//  CharacterDetailsView
//
//  Created by Mangust on 05.05.2022.
//

import UIKit

final class CharacterDetailsView: UIView {

    var outputBlock: ((_ viewModel: CharacterDetailsViewModel) -> Void)?

    private var characterPhoto: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private var nameTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .red
        return label
    }()

    private var name: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textColor = .white
        return label
    }()

    private var descriptionTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .red
        return label
    }()

    private var descriptionContent: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.textColor = .white
        textView.backgroundColor = .darkGray
        return textView
    }()

    private enum Constants {
        static let sidesInset: CGFloat = 20
        static let nameSidesInset: CGFloat = 24
        static let descriptionTopInset: CGFloat = 16
        static let photoHeight: CGFloat = 240
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        setupLayout()
        
        outputBlock = { [weak self] viewModel in
            self?.configure(with: viewModel)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with viewModel: CharacterDetailsViewModel) {
        characterPhoto.sd_setImage(with: viewModel.imageUrl)
        nameTitle.text = CharacterDetailsViewModel.TableHeaders.name.rawValue
        name.text = viewModel.name

        descriptionTitle.text = CharacterDetailsViewModel.TableHeaders.description.rawValue
        descriptionContent.text = viewModel.description

        guard let description = viewModel.description,
              !description.isEmpty else {
            descriptionTitle.isHidden = true
            descriptionContent.isHidden = true

            return
        }

        descriptionTitle.isHidden = false
        descriptionContent.isHidden = false
    }

    private func setupSubviews() {
        backgroundColor = .darkGray
        addSubview(characterPhoto)
        addSubview(nameTitle)
        addSubview(name)
        addSubview(descriptionTitle)
        addSubview(descriptionContent)
    }

    private func setupLayout() {
        characterPhoto.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.photoHeight)
        }

        nameTitle.snp.makeConstraints {
            $0.top.equalTo(characterPhoto.snp.bottom).offset(Constants.sidesInset)
            $0.leading.trailing.equalToSuperview().inset(Constants.sidesInset)
        }

        name.snp.makeConstraints {
            $0.top.equalTo(nameTitle.snp.bottom).offset(Constants.sidesInset)
            $0.leading.trailing.equalToSuperview().inset(Constants.nameSidesInset)
        }

        descriptionTitle.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(Constants.sidesInset)
            $0.leading.trailing.equalToSuperview().inset(Constants.sidesInset)
        }

        descriptionContent.snp.makeConstraints {
            $0.top.equalTo(descriptionTitle.snp.bottom).offset(Constants.descriptionTopInset)
            $0.leading.trailing.bottom.equalToSuperview().inset(Constants.sidesInset)
        }
    }
}
