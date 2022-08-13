import UIKit

class ViewController: UITableViewController {
    	
    let refeicoes = ["Churros", "Macarrão", "Pizza"]
    
    // Mark: After view load
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Working with TableViewController is necessary to have the number of lines (numberOfRows) and contents (cellForRow)

    // Mark: Method numberOfRows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    // Mark: Method cellForRow
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Mark: Instance cel type UITableViewCell (necessary to return)
        let cel = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        // Mark: Get content of array and put in variable cel (based on the row)
        cel.textLabel?.text = refeicoes[indexPath.row]
        
        return cel
    }
}
