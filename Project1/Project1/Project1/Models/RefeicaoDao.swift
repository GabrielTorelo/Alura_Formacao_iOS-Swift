import UIKit

class RefeicaoDao {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getData() -> [Refeicao] {
        do {
            
            // MARK: Get path
            guard let path = getDir() else { return [] }
            
            // MARK: Get encoded data of device
            let data = try Data(contentsOf: path)
            
            // MARK: convert this data
            guard let snackSaved = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Refeicao] else {
                Alerta(controller: controller).showAlert(title: "Desculpe", msg:"Não foi possível acessar os dados de 'refeicoes' do dispositivo")
                return []
            }
            
            return snackSaved
        } catch {
            return []
        }
    }
    
    func save(_ meals: [Refeicao]) {
        // MARK: Create iOS FileManager -> Store encoded files in device
        //
        // MARK: Get path -> Users/...../Documents
        guard let path = getDir() else { return }
        //
        // MARK: To use try in Swift, you need use a "do { ... }"
        do {
            // MARK: Convert "refeicoes" to bits using protocol instantiated in each ClassModel
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            //
            // MARK: Store encoded files
            try data.write(to: path)
        } catch {
            Alerta(controller: controller).showAlert(title: "Desculpe", msg: "Não foi possível salvar os dados no dispositivo")
        }
    }
    
    func getDir() -> URL? {
        guard let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            Alerta(controller: controller).showAlert(title: "Desculpe", msg: "Não foi possível acessar a pasta do dispositivo")
            return nil
        }
        
        // MARK: Create file name -> After Users/...../Documents/refeicoesData
        return dir.appendingPathComponent("refeicoesData")
    }
}
