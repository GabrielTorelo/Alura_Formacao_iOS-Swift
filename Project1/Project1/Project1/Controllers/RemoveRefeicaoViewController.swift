import UIKit

class RemoveRefeicaoViewController {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibeAlerta(_ snack: Refeicao, handler: @escaping (UIAlertAction) -> Void = {alert in}) {
        
        // MARK: Create iOS Alert
        Alerta(controller: controller).showAlert(title: snack.name, msg: snack.details(), remove: true, removeMethod: handler)
    }
}
