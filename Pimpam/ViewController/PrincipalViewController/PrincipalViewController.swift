//
//  PrincipalViewController.swift
//  Pimpam
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit
import SDWebImage

class PrincipalViewController: UIViewController {
    @IBOutlet weak var recipesTable: UITableView!
    internal var types: [Types] = []
    
    convenience init(types:[Types]){
        self.init()
        self.types = types
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        loadAllTypes()
        self.title = NSLocalizedString("Tipos" , comment: "")

        // Do any additional setup after loading the view.
    }
    
    private func registerCells ()
    {
        let indentifier = "PrincipalTableViewCell"
        let cellNib = UINib(nibName: indentifier, bundle: nil)
        recipesTable.register(cellNib, forCellReuseIdentifier: "PrincipalTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func loadAllTypes(){
        let meat = Types(name: "Carnes", description: "Las mejores recetas carnicas", numplats: "50", foodimg: "https://i.pinimg.com/236x/69/b2/73/69b27355445cb6e33b35cced3269ecd6--remember-this-cow.jpg")
        let fish = Types(name: "Pescado", description: "Bueno para el cerebro", numplats: "50", foodimg: "https://i1.wp.com/www.sopitas.com/wp-content/uploads/2018/11/bob-esponja.png")
         let poultry = Types(name: "Aves", description: "Mejores aves de corral", numplats: "50", foodimg: "https://http2.mlstatic.com/anteojos-cotillon-para-chicos-chicken-little-disney-D_NQ_NP_816367-MLA25631189073_052017-F.jpg")
         let vegetables = Types(name: "Vegetales", description: "Para los locos vegetarianos", numplats: "50", foodimg: "https://vignette.wikia.nocookie.net/ideas/images/3/3a/Mochilo_%28_los_fruittis_%29.jpg")
         let salads = Types(name: "Ensaladas", description: "Para esos kilitos de más", numplats: "50", foodimg: "https://upload.wikimedia.org/wikipedia/it/thumb/5/51/Saladfinger.jpg/260px-Saladfinger.jpg")
         let pasta = Types(name: "Pasta", description: "Para esos pisos de estudiantes", numplats: "50", foodimg: "https://images.vectorhq.com/images/istock/previews/4975/49759696-cartoon-gross-spaghetti-monster.jpg")
         let soups = Types(name: "Sopas", description: "Para las abuelas más modernas", numplats: "50", foodimg: "https://i.pinimg.com/originals/e4/ea/1b/e4ea1b28dd32c6f071c3086f4129ce3b.jpg")
         let desserts = Types(name: "Postres", description: "Abstenerse Celiacos y diabeticos", numplats: "50", foodimg: "https://res.cloudinary.com/jerrick/image/upload/f_auto,fl_progressive,q_auto,c_fit,w_1100/qslcamn8sc7913wrmvkn")
        types.append(meat)
        types.append(fish)
        types.append(poultry)
        types.append(vegetables)
        types.append(salads)
        types.append(pasta)
        types.append(soups)
        types.append(desserts)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension PrincipalViewController: UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return types.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PrincipalTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "PrincipalTableViewCell", for: indexPath)as? PrincipalTableViewCell)!
        let type = types[indexPath.row]
        cell.titlelabel?.text = type.name
        cell.descriptionlabel?.text = type.description
        cell.numberlabel?.text = type.numplats
        cell.foodimg?.sd_setImage(with: URL(string: type.foodimg), completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recVC = RecipesListViewController()
        navigationController?.pushViewController(recVC, animated: true)
    }
}
