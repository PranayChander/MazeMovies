//
//  HomeViewController.swift
//  MazeMovies
//
//  Created by pranay chander on 13/02/21.
//

import UIKit

enum HomeSections: CaseIterable {
    case nowShowing, genres, topRated, popular, upcoming
    var title: String {
        switch self {
        case .nowShowing:
            return "Now Showing"
        case .genres:
            return "Genres"
        case .topRated:
            return "Top Rated"
        case .popular:
            return "Popular"
        case .upcoming:
            return "Upcoming"
        }
    }
}

class HomeViewController: MMViewController {
    var collectionView: UICollectionView!
    let sections = HomeSections.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: createLayout())
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.view.addSubview(self.collectionView)
        self.collectionView.constrainToSafeArea()
        registerCollectionViewCells()
    }

    private func registerCollectionViewCells() {
        self.collectionView.MMRegister(NowShowingCollectionViewCell.self)
        self.collectionView.MMRegister(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: "header")
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (section: Int, _) -> NSCollectionLayoutSection? in
            switch self.sections[section] {
            case .nowShowing :
                return self.createNowShowingLayout()
            case .genres:
                return self.createGenresLayout()
            case .popular, .topRated:
                return self.createTopRatedLayout()
            default:
                return self.createUpcomingLayout()
            }
        }
    }

    private func createNowShowingLayout() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.05))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "header",
            alignment: .top)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),
                                               heightDimension: .fractionalHeight(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 10.0
        section.contentInsets = NSDirectionalEdgeInsets.MMCollectionViewDefaultInsets
        section.boundarySupplementaryItems = [header]
        return section
    }

    private func createGenresLayout() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.05))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: "header",
                                                                 alignment: .top)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                               heightDimension: .fractionalWidth(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5.0
        section.contentInsets = NSDirectionalEdgeInsets.MMCollectionViewDefaultInsets
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        return section
    }

    private func createTopRatedLayout() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.05))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "header",
            alignment: .top)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                               heightDimension: .fractionalWidth(0.3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.MMCollectionViewDefaultInsets
        section.interGroupSpacing = 10.0
        section.orthogonalScrollingBehavior = .groupPaging
        section.boundarySupplementaryItems = [header]
        return section
    }

    private func createUpcomingLayout() -> NSCollectionLayoutSection {
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.05))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "header",
            alignment: .top)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.MMCollectionViewDefaultInsets
        section.interGroupSpacing = 10.0
        section.boundarySupplementaryItems = [header]
        return section
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.sections[section] {
        case .nowShowing:
            return 7
        default:
            return 7
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.sections[indexPath.section] {
        case .nowShowing:
            let cell: NowShowingCollectionViewCell = self.collectionView.MMDequeueReusableCell(for: indexPath)
            return cell
        default:
            guard let cell = self.collectionView.dequeueReusableCell(
                    withReuseIdentifier: NowShowingCollectionViewCell.reuseIdentifier,
                    for: indexPath) as? NowShowingCollectionViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: "header",
                withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier,
                for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        header.titleLabel.text = self.sections[indexPath.section].title
        return header
    }
}
