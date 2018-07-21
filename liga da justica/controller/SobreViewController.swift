import UIKit

class SobreViewController: UIViewController {
    @IBOutlet weak var lbQtde: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.lbQtde.text = String(delegate.cadastro.count())
    }
}
