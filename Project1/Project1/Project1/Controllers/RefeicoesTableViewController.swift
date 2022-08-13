import UIKit

// MARK: Create main class and set ViewControllerDelegate
class RefeicoesTableViewController: UITableViewController, AddRefeicaoDelegate {
    
    // MARK: Declaration objects type "Refeicoes"
    var meals: [Refeicao] = []
    
    // MARK: Create View life cycle (viewDidLoad - run code after page load)
    override func viewDidLoad() {
        
        // MARK: Get items from file
        meals = RefeicaoDao(controller: self).getData()
    }
    
    // Working with TableViewController is necessary to have the number of lines (numberOfRows) and contents (cellForRow)

    // MARK: Method numberOfRows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    // MARK: Method cellForRow
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: Instance cel type UITableViewCell (necessary for return)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // MARK: Instance ref, which is current array
        let snack = meals[indexPath.row]
        
        // MARK: Get content of array and put in variable cel (based on the row)
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
            guard let index = tableView.indexPath(for: cell) else {
                Alerta(controller: self).showAlert(msg: "Posição da coluna indefinida!")
                return
            }
            
            // MARK: Create constant with current content of the row
            let snack = meals[index.row]
            
            // MARK: Call Controller remove
            RemoveRefeicaoViewController(controller: self).exibeAlerta(snack, handler: {
                alert in
                self.meals.remove(at: index.row)
                self.tableView.reloadData()
                
                // MARK: Edite changes in file
                RefeicaoDao(controller: self).save(self.meals)
            })
        }
    }
    
    // MARK: Method add data in array
    func addData(_ snack: Refeicao) {
        
        // MARK: Add new "refeicao" in "refeicoes"
        meals.append(snack)
        
        // MARK: Update the TableView
        tableView.reloadData()
        
        RefeicaoDao(controller: self).save(meals)
    }
    
    // MARK: Get viewController for use in another controller
    // This is possible because this method has access the target of ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // MARK: Check if identifier is "add"
        if segue.identifier == "add" {
            
            // MARK: Try convert UIViewController to ViewController and store in a constant if was possible
            if let viewController = segue.destination as? ViewController {
                
                // MARK: Indicate the variable "tableViewController" of ViewController is equal a this controller
                viewController.delegate = self
            }
        }
    }
}
