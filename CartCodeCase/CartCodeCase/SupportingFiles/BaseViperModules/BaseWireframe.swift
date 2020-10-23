import UIKit

protocol WireframeDataProtocol {
    
}

protocol WireframeInterface: class {
    func presentFurtherWireframes(_ wireframes: Wireframes)
    func displayWarning(controller: UIAlertController, completion: (() -> Void)?)
}

class BaseWireframe {

    private unowned var _viewController: UIViewController

    //to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?

    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {
    func presentFurtherWireframes(_ wireframes: Wireframes) {
        viewController.presentWireframe(wireframes.value)
    }
    
    func displayWarning(controller: UIAlertController, completion: (() -> Void)?) {
        viewController.present(controller, animated: true, completion: completion)
    }
}

extension BaseWireframe {

    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

}

extension UIViewController {

    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
    func presentWireframe(_ wireframe: Wireframes, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.value.viewController, animated: animated, completion: completion)
    }

}

extension UINavigationController {

    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.setViewControllers([wireframe.viewController], animated: animated)
    }
    
    func pushWireframe(_ wireframe: Wireframes, animated: Bool = true) {
        self.pushViewController(wireframe.value.viewController, animated: animated)
    }

    func setRootWireframe(_ wireframe: Wireframes, animated: Bool = true) {
        self.setViewControllers([wireframe.value.viewController], animated: animated)
    }

}
