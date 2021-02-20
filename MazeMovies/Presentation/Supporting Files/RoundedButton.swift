//
//  RoundedButton.swift
//  MazeMovies
//
//  Created by pranay chander on 20/02/21.
//

import UIKit

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = frame.height/2
    }
}
