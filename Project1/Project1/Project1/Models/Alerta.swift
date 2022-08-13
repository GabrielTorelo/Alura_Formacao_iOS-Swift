import UIKit

class Alerta {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: Create method showAlert
    func showAlert(title: String = "Atenção", msg: String, remove:Bool = false, removeMethod: @escaping (UIAlertAction) -> Void = {alert in}) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let btn = UIAlertAction(title: "Cancelar", style: .cancel)
        if remove {
            let btnRemove = UIAlertAction(title: "Remover", style: .destructive, handler: removeMethod)
            alert.addAction(btnRemove)
        }
        alert.addAction(btn)
        controller.present(alert, animated: true)
    }
}
