//
//  TitleCustomView.swift
//  TitleCustomView
//
//  Created by Mangust on 04.05.2022.
//

import UIKit

final class TitleCustomView: UIView {

    private enum Constants {
        static let offset: CGFloat = 10
        static let fillColor: UIColor = .white
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()

        path.move(to: CGPoint(x: bounds.minX + Constants.offset, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX - Constants.offset, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))

        path.close()
        Constants.fillColor.setFill()
        path.fill()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
