import UIKit

// MARK: Create Interface
protocol AddItemDelegate {
    func addData(_ item: Item)
}

class AddItensViewController: UIViewController {
    
    // MARK: Instance IBOutlet
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var calTextField: UITextField?
    
    // MARK: Attributes
    var delegate: AddItemDelegate?
    
    // MARK:  Constructor
    init(delegate: AddItemDelegate) {
        super.init(nibName: "AddItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    // MARK: Required due to inherited
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Create View life cycle (viewDidLoad - run code after page load)
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Instance IBAction
    @IBAction func addItem(_ sender: Any) {
        if let nameGuard = nomeTextField?.text, let calGuard = calTextField?.text {
            if nameGuard != "" && calGuard != "" {
                guard let calGuardDouble = Double(calGuard) else {
                    Alerta(controller: self).showAlert(msg: "Campo caloria deve ser um número decimal!")
                    return
                }
                
                // MARK: Add item to ArrayList
                let item = Item(name: nameGuard, cal: calGuardDouble)
                
                // MARK: Delegate below is optional
                delegate?.addData(item)
                
                // MARK: Another method of handle optional, check if exist
                // guard let delegateGuard = delegate else {
                //     Alerta(controller: self).showAlert(msg: "Delegate não existe!")
                //     return
                // }
                //
                // MARK: Add item to ArrayList
                // delegateGuard.addData(item)
                
                // MARK: Remove addItemScreen of stack (pop screen)
                navigationController?.popViewController(animated: true)
            } else {
                Alerta(controller: self).showAlert(msg: "Campos não podem ser nulos!")
            }
        } else {
            Alerta(controller: self).showAlert(msg: "Campos inválidos!")        }
    }
}
