import UIKit

class HomeTableViewHeader: UIView {
    
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bannerView: UIView!
    
    func configView() {
        
        // MARK: Sets background color in headerView
        headerView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
        
        // MARK: Sets border radius in bannerView and sets clipping mask in content
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        
        // MARK: Sets border radius in headerView with border only bottom left and bottom right
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}
