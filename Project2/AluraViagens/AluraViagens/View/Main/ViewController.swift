import UIKit

class ViewController: UIViewController {
    
    // MARK: Instance IBOutlets
    @IBOutlet weak var viagensTableView: UITableView!
    
    // MARK: Component life cycle (call after load view)
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    // MARK: Settings -> ViagemTableView
    func configTableView() {
        
        // MARK: Instance ViagemTableViewCell
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
    }
}

// MARK: Create extension to separate the UITableViewDataSource protocol of class
extension ViewController: UITableViewDataSource {
    
    // Working with TableViewController is necessary to have the number of lines (numberOfRows) and contents (cellForRow)
    
    // MARK: Method numberOfRows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // MARK: Sets number of cells
        let numberOfRows = sessaoDeViagens?[section].numbLine ?? 0
        
         return numberOfRows
    }
    
    // MARK: Method cellForRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // MARK: Instance cell (type: UITableViewCell, because this is the return)
        // Call method to reuse layout ViagemTableViewCell for each cell and casting this constant to type ViagemTableViewCell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else { fatalError("Erro na criação da célula") }
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.type {
        case .destaques:
            cell.configCell(viewModel?.travel[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: Create extension to separate the UITableViewDelegate protocol of class
extension ViewController: UITableViewDelegate {
    
    // MARK: Sets HomeTableViewHeader as header to ViewController
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // MARK: Load UIView -> HomeTableViewHeader
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configView()
        
        return headerView
    }
    
    // MARK: Sets UIView header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        // MARK: Sets header height depending on the device (if [iphone] { = 300} else { = 400})
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 300 : 400
    }
    
    // MARK: Method heightForRowAt (set height to cell)
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // MARK: Sets cell height depending on the device (if [iphone] { = 400} else { = 475})
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475
    }
}
