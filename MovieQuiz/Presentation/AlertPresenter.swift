import UIKit
import Foundation

final class AlertPresenter {
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func show(alertModel: AlertModel) {
        let alert = UIAlertController(
            title: alertModel.title,
            message: alertModel.message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: alertModel.buttonText,
            style: .default
        ) { _ in
            alertModel.completion()
        }

        alert.addAction(action)

        alert.view.accessibilityIdentifier = "GameResultsAlert"
        viewController?.present(alert, animated: true, completion: nil)
    }
}

