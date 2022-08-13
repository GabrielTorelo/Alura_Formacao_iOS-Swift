import UIKit

class RemoveItemViewController {
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibeAlerta(_ item: Item, handler: @escaping (UIAlertAction) -> Void = {alert in}) {
        
        // MARK: Create iOS Alert
        Alerta(controller: controller).showAlert(title: item.name, msg: item.details(), remove: true, removeMethod: handler)
    }
}
