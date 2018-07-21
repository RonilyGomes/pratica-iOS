import UIKit

class FormViewController: UIViewController{
    
    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfImage: UITextField!
    @IBOutlet weak var stNota: UIStepper!
    @IBOutlet weak var swPoder: UISwitch!
    @IBOutlet weak var lbNota: UILabel!
    @IBOutlet weak var imgHeroi: UIImageView!
    
    var index: Int!
    var cadastro: Cadastro!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        self.cadastro = delegate.cadastro
    }
    
    @IBAction func definirNota(_ sender: Any) {
        let nota = Int(self.stNota.value)
        self.lbNota.text = String(nota)
    }
    
    @IBAction func salvar(_ sender: Any) {
        let nome = self.tfNome.text!
        let image = self.tfImage.text!
        let nota = Int(self.stNota.value)
        let poder = self.swPoder.isOn

        let heroi = Heroi(nome: nome, img: image, nota: nota, poder: poder)
        
        if (self.index != nil){
            self.cadastro.update(index: self.index, heroi: heroi)
        }else{
            self.cadastro.add(heroi: heroi)
        }

        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        if (self.index != nil){
            let heroi = self.cadastro.get(index: self.index)
            self.tfNome.text = heroi.nome
            self.tfImage.text = heroi.img
            self.lbNota.text = String(heroi.nota)
            self.stNota.value = Double(heroi.nota)
            self.swPoder.isOn = heroi.poder
            
            let url = URL(string: heroi.img!)
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                self.imgHeroi.image = UIImage(data: imageData)
            }
        }

        self.tfNome.becomeFirstResponder()
    }
    
}
