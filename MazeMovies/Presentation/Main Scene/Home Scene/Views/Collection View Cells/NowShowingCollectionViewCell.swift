//
//  NowShowingCollectionViewCell.swift
//  MazeMovies
//
//  Created by pranay chander on 16/02/21.
//

import UIKit

class NowShowingCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "NowShowingCollectionViewCell"
    private let imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = .lightGray
        img.clipsToBounds = true
        img.image = UIImage(systemName: "infinity")
        img.layer.cornerRadius = 10.0
        return img
    }()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addSubview(imageView)
        imageView.constrainToSuperview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
