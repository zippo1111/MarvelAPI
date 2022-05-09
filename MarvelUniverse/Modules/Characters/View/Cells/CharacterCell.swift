//
//  CharacterCell.swift
//  CharacterCell
//
//  Created by Mangust on 04.05.2022.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage

final class CharacterCell: UITableViewCell {
    var activityIndicator = UIActivityIndicatorView()
    
    private var viewModel: CharacterViewModel?

    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.addSubview(titleView)
        return imageView
    }()

    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private lazy var titleView: TitleCustomView = {
        let view = TitleCustomView(frame: .zero)
        view.backgroundColor = .clear
        view.addSubview(title)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        addSubview(characterImage)
        addSubview(activityIndicator)

        activityIndicator.color = .white

        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(viewModel: CharacterViewModel) {
        self.viewModel = viewModel

        title.text = viewModel.title
        characterImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        characterImage.sd_setImage(with: viewModel.imageUrl)
    }

    private func configureLayout() {
        characterImage.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        titleView.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(60)
            $0.width.equalTo(240)
        }
        title.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        activityIndicator.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(20)
        }
    }
}
