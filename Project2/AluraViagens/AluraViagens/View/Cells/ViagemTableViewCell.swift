import UIKit

class ViagemTableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var travelImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var dailyLabel: UILabel!
    @IBOutlet weak var priceWDLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var cancelStatusLabel: UILabel!
    
    func configCell(_ travel: Viagem?) {
        
        // MARK: Instance constant -> anable attributes definition
        let priceWD = NSMutableAttributedString(string: "R$ \(travel?.precoSemDesconto ?? 0.00)")
        
        // MARK: Sets attribute type strikethrough to constant string
        priceWD.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, priceWD.length))
        
        travelImageView.image = UIImage(named: travel?.asset ?? "")
        titleLabel.text = travel?.titulo ?? ""
        subTitleLabel.text = travel?.subtitulo ?? ""
        if let daily = travel?.diaria, let guest = travel?.hospedes {
            dailyLabel.text = "\(daily) \(daily == 1 ? "Diária" : "Diárias") - \(guest) \(guest == 1 ? "Pessoa" : "Pessoas")"
        } else {
            dailyLabel.text = "\(0) Diárias - \(0) Pessoas"
        }
        priceWDLabel.attributedText = priceWD
        discountPriceLabel.text = "R$ \(travel?.preco ?? 0.00)"
        cancelStatusLabel.text = travel?.cancelamento ?? ""
        
        // MARK: Adds shadow in cell border
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()
        }
    }
}
