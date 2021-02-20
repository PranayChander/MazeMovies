//
//  UIView+Additions.swift
//  MazeMovies
//
//  Created by pranay chander on 07/02/21.
//

import UIKit

extension UIView {
    enum AnchorConstraint {
        case superview(CGFloat)
        case safeArea(CGFloat)
        case safeAreaGreaterThanOrEqualTo(CGFloat)
    }

    func constrain(leadingAnchor: AnchorConstraint,
                   trailingAnchor: AnchorConstraint,
                   topAnchor: AnchorConstraint,
                   bottomAnchor: AnchorConstraint) {
        guard let superview = self.superview else {
            fatalError("SuperView can't be nil")
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        var constraints = [NSLayoutConstraint]()
        switch leadingAnchor {
        case .superview(let constant):
            constraints.append(self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant))
        case .safeArea(let constant) :
            constraints.append(self.leadingAnchor.constraint(
                                equalTo: superview.safeAreaLayoutGuide.leadingAnchor,
                                constant: constant))
        case .safeAreaGreaterThanOrEqualTo(let constant) :
            constraints.append(self.leadingAnchor.constraint(
                                greaterThanOrEqualTo: superview.safeAreaLayoutGuide.leadingAnchor,
                                constant: constant))
        }
        switch trailingAnchor {
        case .superview(let constant):
            constraints.append(self.trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                                              constant: -constant))
        case .safeArea(let constant) :
            constraints.append(self.trailingAnchor.constraint(
                                equalTo: superview.safeAreaLayoutGuide.trailingAnchor, constant: -constant))
        case .safeAreaGreaterThanOrEqualTo(let constant) :
            constraints.append(self.trailingAnchor.constraint(
                                greaterThanOrEqualTo: superview.safeAreaLayoutGuide.trailingAnchor,
                                constant: -constant))
        }
        switch topAnchor {
        case .superview(let constant):
            constraints.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant))
        case .safeArea(let constant) :
            constraints.append(self.topAnchor.constraint(
                                equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: constant))
        case .safeAreaGreaterThanOrEqualTo(let constant) :
            constraints.append(self.topAnchor.constraint(
                                greaterThanOrEqualTo: superview.safeAreaLayoutGuide.topAnchor,
                                constant: constant))
        }
        switch bottomAnchor {
        case .superview(let constant):
            constraints.append(self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant))
        case .safeArea(let constant) :
            constraints.append(self.bottomAnchor.constraint(
                                equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
                                constant: -constant))
        case .safeAreaGreaterThanOrEqualTo(let constant) :
            constraints.append(self.bottomAnchor.constraint(
                                greaterThanOrEqualTo: superview.safeAreaLayoutGuide.bottomAnchor, constant: -constant))
        }
        NSLayoutConstraint.activate(constraints)
    }

    func constrainToSuperview(leadingConstant leading: CGFloat = 0.0,
                              trailingConstant trailing: CGFloat = 0.0,
                              topConstant top: CGFloat = 0.0,
                              bottomConstant bottom: CGFloat = 0.0) {
        self.constrain(leadingAnchor: .superview(leading),
                       trailingAnchor: .superview(trailing),
                       topAnchor: .superview(top),
                       bottomAnchor: .superview(bottom))
    }
    func constrainToSafeArea(leadingConstant leading: CGFloat = 0.0,
                             trailingConstant trailing: CGFloat = 0.0,
                             topConstant top: CGFloat = 0.0,
                             bottomConstant bottom: CGFloat = 0.0) {
        self.constrain(leadingAnchor: .safeArea(leading),
                       trailingAnchor: .safeArea(trailing),
                       topAnchor: .safeArea(top),
                       bottomAnchor: .safeArea(bottom))
    }
    func constrainToSafeAreaGreaterThan(leadingConstant leading: CGFloat = 0.0,
                                        trailingConstant trailing: CGFloat = 0.0,
                                        topConstant top: CGFloat = 0.0,
                                        bottomConstant bottom: CGFloat = 0.0) {
        self.constrain(leadingAnchor: .safeAreaGreaterThanOrEqualTo(leading),
                       trailingAnchor: .safeAreaGreaterThanOrEqualTo(trailing),
                       topAnchor: .safeAreaGreaterThanOrEqualTo(top),
                       bottomAnchor: .safeAreaGreaterThanOrEqualTo(bottom))
    }
}
