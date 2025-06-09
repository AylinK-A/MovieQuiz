import UIKit

enum AlertPresenter {
    static func show(alertModel: AlertModel, on viewController: UIViewController) {
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
        viewController.present(alert, animated: true, completion: nil)
    }
}

