
import Foundation
import UIKit

class MainRouter: MainRoutingProtocol {

    private let assembly: MainAssemblyProtocol
    private let homeRouter: HomeRoutingProtocol
    private let accountRouter: AccountRoutingProtocol
    private let listsRouter: ListsRoutingProtocol

    init(assembly: MainAssemblyProtocol,
         homeRouter: HomeRoutingProtocol,
         accountRouter: AccountRoutingProtocol,
         listsRouter: ListsRoutingProtocol) {
        self.assembly = assembly
        self.homeRouter = homeRouter
        self.accountRouter = accountRouter
        self.listsRouter = listsRouter
    }

    func showMainStory(_ viewController: UIViewController, animated: Bool) {

        let tabBarController = assembly.assemblyTabBarController()
        let homeNavigationController = getHomeViewController()
        let listsNavigationController = getListsViewController()
        let accountNavigationController = getAccountViewController()
        let viewControllers: [UIViewController] = [homeNavigationController,
                                                   listsNavigationController,
                                                   accountNavigationController]

        tabBarController.setViewControllers(viewControllers, animated: animated)

        if viewController is UINavigationController {
            guard let navigationController = viewController as? UINavigationController else { return }

            navigationController.viewControllers = [tabBarController]
            navigationController.navigationBar.isHidden = true
        }
    }
}

// MARK: - setup TabBarItem
private extension MainRouter {

    func getHomeViewController() -> UIViewController {
        var homeNavigationController: UIViewController = UINavigationController()
        homeRouter.showHomeStory(from: &homeNavigationController, animated: true)
        return homeNavigationController
    }

    func getAccountViewController() -> UIViewController {
        var accountNavigationController: UIViewController = UINavigationController()
        accountRouter.showAccountStory(from: &accountNavigationController, animated: true)
        return accountNavigationController
    }

    func getListsViewController() -> UIViewController {
        var listsNavigationController: UIViewController = UINavigationController()
        listsRouter.showListsStory(from: &listsNavigationController, animated: true)
        return listsNavigationController
    }
}
