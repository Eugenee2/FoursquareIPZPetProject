

import Foundation
import UIKit

class AccountAssembly: AccountAssemblyProtocol {
    func assemblyAccountViewController() -> AccountViewController {
        let controllerID = String(describing: AccountViewController.self)
        let accountController = getStoryboard()
            .instantiateViewController(withIdentifier: controllerID)
            as! AccountViewController
        return accountController
    }
}

// MARK: - getStoryboard
private extension AccountAssembly {

    func getStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "AccountStoryboard", bundle: nil)
    }
}
