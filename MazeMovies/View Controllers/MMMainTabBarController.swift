//
//  MMMainTabBarController.swift
//  MazeMovies
//
//  Created by pranay chander on 13/02/21.
//

import UIKit

class MMMainTabBarController: UITabBarController {
    lazy var homeViewController: HomeViewController = {
        let homeVC = HomeViewController()
        homeVC.title = "Home"
        homeVC.tabBarItem.image =  UIImage(systemName: "house")
        homeVC.tabBarItem.selectedImage =  UIImage(systemName: "house.fill")
        return homeVC
    }()
    lazy var searchViewController: SearchViewController = {
        let searchVC = SearchViewController()
        searchVC.tabBarItem.image =  UIImage(systemName: "magnifyingglass")
        searchVC.title = "Search"
        return searchVC
    }()
    lazy var favoritesViewController: FavoritesViewController = {
        let favoritesVC = FavoritesViewController()
        favoritesVC.tabBarItem.image =  UIImage(systemName: "heart")
        favoritesVC.tabBarItem.selectedImage =  UIImage(systemName: "heart.fill")
        favoritesVC.title = "Favorites"
        return favoritesVC
    }()
    lazy var watchlistViewController: WatchListViewController = {
        let watchlistVC = WatchListViewController()
        watchlistVC.tabBarItem.image =  UIImage(systemName: "book")
        watchlistVC.tabBarItem.selectedImage =  UIImage(systemName: "book.fill")
        watchlistVC.title = "WatchList"
        return watchlistVC
    }()
    lazy var profileViewController: ProfileViewController = {
        let searchVC = ProfileViewController()
        searchVC.tabBarItem.image =  UIImage(systemName: "person")
        searchVC.tabBarItem.selectedImage =  UIImage(systemName: "person.fill")
        searchVC.title = "Profile"
        return searchVC
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewControllers = [
            UINavigationController(rootViewController: favoritesViewController) ,
            UINavigationController(rootViewController: searchViewController),
            UINavigationController(rootViewController: homeViewController),
            UINavigationController(rootViewController: watchlistViewController),
            UINavigationController(rootViewController: profileViewController)]
        self.selectedIndex = 2
    }

}
