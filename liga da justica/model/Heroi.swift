import Foundation

class Heroi: NSObject, NSCoding {
    var nome: String!
    var img: String!
    var nota: Int!
    var poder: Bool!
    
    override var description: String{
        return self.nome!
    }
    
    // construtor memória
    init(nome: String, img: String, nota: Int, poder: Bool) {
        self.nome = nome
        self.img = img
        self.nota = nota
        self.poder = poder
    }
    
    // construtor arquivo
    required init?(coder aDecoder: NSCoder) {
        self.nome = aDecoder.decodeObject(forKey: "nome") as! String
        self.img = aDecoder.decodeObject(forKey: "img") as! String
        self.nota = aDecoder.decodeObject(forKey: "nota") as! Int
        self.poder = aDecoder.decodeObject(forKey: "poder") as! Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nome, forKey: "nome")
        aCoder.encode(self.img, forKey: "img")
        aCoder.encode(self.nota, forKey: "nota")
        aCoder.encode(self.poder, forKey: "poder")
    }
}
