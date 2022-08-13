import UIKit

// MARK: Create Interface
protocol AddRefeicaoDelegate {
    func addData(_ snack: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {
    
    // MARK: Instance IBOutlet
    @IBOutlet weak var nomeTextField: UITextField?
    @IBOutlet weak var felicTextField: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: Attributes
    var items: [Item] = []
    var itemsSelect: [Item] = []
    
    // MARK: Create View life cycle (viewDidLoad - run code after page load)
    override func viewDidLoad() {
        
        // MARK: Instance UIBarButtonItem
        let btnAddIten = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(addItem))
        
        // MARK: Add button in the view
        navigationItem.rightBarButtonItem = btnAddIten
        
        // MARK: Get items from file
        items = ItemDao(controller: self).getData()
    }
    
    // MARK: Method addItem (Call new screen) -> @objc ObjectiveC directive
    @objc func addItem() {
        let addItensViewController = AddItensViewController(delegate: self)
        navigationController?.pushViewController(addItensViewController, animated: true)
    }
    
    // MARK: Method addData (add new ingredient)
    func addData(_ item: Item) {
        items.append(item)
        if let itensTableViewGuard = itensTableView {
            itensTableViewGuard.reloadData()
        } else {
            // MARK: Create iOS Alert
            Alerta(controller: self).showAlert(title: "Desculpe", msg: "Não foi possível atualizar a tabela")
        }
        
        ItemDao(controller: self).save(items)
    }
    
    // MARK: Instance Delegate
    var delegate: AddRefeicaoDelegate?
    
    // Working with TableViewController is necessary to have the number of lines (numberOfRows) and contents (cellForRow)

    // MARK: Method numberOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // MARK: Method cellForRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let snack = items[indexPath.row]
        
        cell.textLabel?.text = snack.name
        
        // MARK: Get user gesture
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleDetails(_:)))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    // MARK: Method call after longPress gesture
    @objc func handleDetails(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            
            // MARK: Create constant and convert from "UIView" type to "UITableViewCell" (Casting)
            let cell = gesture.view as! UITableViewCell
            
            // MARK: Get indexPath of column and set in protect constant
            guard let index = itensTableView?.indexPath(for: cell) else {
                Alerta(controller: self).showAlert(msg: "Posição da coluna indefinida!")
                return
            }
            
            // MARK: Create constant with current content of the row
            let item = items[index.row]
            
            // MARK: Call Controller remove
            RemoveItemViewController(controller: self).exibeAlerta(item, handler: {
                alert in
                self.items.remove(at: index.row)
                guard (self.itensTableView?.reloadData()) != nil else {
                    Alerta(controller: self).showAlert(title: "Desculpe", msg: "Não foi possível atualizar a tabela!")
                    return
                }
                
                // MARK: Edite changes in file
                ItemDao(controller: self).save(self.items)
            })
        }
    }
    
    // MARK: method didSelectRow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        let item = items[indexPath.row]
        
        // MARK: Add checkmark and ingredient in array
        if cell.accessoryType == .none{
            itemsSelect.append(item)
            cell.accessoryType = .checkmark
        }
        
        // MARK: Remove checkmark and ingredient of array
        else {
            if let posi = itemsSelect.firstIndex(of: item) {
                itemsSelect.remove(at: posi)
            }
            cell.accessoryType = .none
        }
    }
    
    func getDataForm() -> Refeicao? {
        guard let nameGuard = nomeTextField?.text, let happGuard = felicTextField?.text else {
            Alerta(controller: self).showAlert(msg: "Campos inválidos!")
            return nil
        }
        
        if nameGuard != "" && happGuard != "" {
            guard let happGuardInt = Int(happGuard) else {
                Alerta(controller: self).showAlert(msg: "Campo felicidade deve ser um número inteiro!")
                return nil
            }
            
            return Refeicao(name: nameGuard, happ: happGuardInt, items: itemsSelect)
        } else {
            Alerta(controller: self).showAlert(msg: "Campos não podem ser nulos!")
            return nil
        }
    }
    
    // MARK: Instance IBAction
    @IBAction func adicionar(_ sender: Any) {
        guard let snackGuard = getDataForm() else {
            Alerta(controller: self).showAlert(title: "Desculpe", msg: "Não foi possível adicionar a refeição")
            return
        }
        
        // MARK: Add current data in array of TableView
        delegate?.addData(snackGuard)
        
        // MARK: Remove addScreen of stack (pop screen)
        navigationController?.popViewController(animated: true)
    }
}
