//
//  HeaderCollectionReusableView.swift
//  MazeMovies
//
//  Created by pranay chander on 17/02/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let reuseIdentifier = "HeaderCollectionReusableView"
    let headerTitle = ""

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(titleLabel)
        titleLabel.constrainToSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
