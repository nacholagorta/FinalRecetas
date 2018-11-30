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
        let meat1 = Recipes(recipeTitle : "Hamburguesa del sur", recipeDifficulty : "Básico", recipeImg: "https://sevilla.abc.es/gurme//wp-content/uploads/2013/01/hamburguesa-carne-picada-1440x810.jpg", recipeIngredients: "Carne,Patatas,Salsa" )
        let meat2 = Recipes(recipeTitle : "Pastel de carne con patatas", recipeDifficulty : "Difícil", recipeImg: "https://cdn5.recetasdeescandalo.com/wp-content/uploads/2017/10/Pastel-de-carne-picada-y-patata-con-queso.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let meat = Types(name: "Carnes", description: "No se admiten Veganos", numplats: 2, foodimg: "https://www.supertambo.es/web/tambo/img/noticias/26/tipos-de-carne-y-sus-caracteristicas-grande.jpg", arrRecipes: [meat1, meat2] )
        let fish1 = Recipes(recipeTitle : "Pescadito empanado", recipeDifficulty : "Medio", recipeImg: "https://img.taste.com.au/KFln5Pso/w506-h253-cfill/taste/2016/11/lentil-rice-with-turmeric-fish-76468-1.jpeg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let fish2 = Recipes(recipeTitle : "Salmón con ensalada de piña", recipeDifficulty : "Difícil", recipeImg: "https://www.chatelaine.com/wp-content/uploads/2017/05/barbecued-trout-1.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let fish = Types(name: "Pescado", description: "Tirar la caña", numplats: 2, foodimg:"https://www.livemint.com/rf/Image-621x414/LiveMint/Period2/2017/08/23/Photos/Processed/fish-k8KF--621x414@LiveMint.jpg", arrRecipes: [fish1, fish2])
        let poultry1 = Recipes(recipeTitle : "Muslos de pollo con salsa", recipeDifficulty : "Básico", recipeImg: "http://images.media-allrecipes.com/images/75769.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let poultry2 = Recipes(recipeTitle : "Pollo asado al limón", recipeDifficulty : "Medio", recipeImg: "https://whatscookingamerica.net/wp-content/uploads/2015/03/TuscanChicken23.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let poultry = Types(name: "Aves", description: "Por si comes pájaros", numplats: 2, foodimg:"https://thumbs.dreamstime.com/t/aves-de-corral-del-palillo-cocidas-en-horno-87236106.jpg", arrRecipes: [poultry1, poultry2])
        let vegetables1 = Recipes(recipeTitle : "Sofrito de verduras", recipeDifficulty : "Medio", recipeImg: "https://assets.kraftfoods.com/recipe_images/opendeploy/191228_640x428.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let vegetables2 = Recipes(recipeTitle : "Pimientos fritos", recipeDifficulty : "Fácil", recipeImg: "https://www.leannebrown.com/wp-content/uploads/2015/04/cornmeal-crusted-green-beans-1024x680.jpeg.pagespeed.ce.-WB2Wndsu7.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let vegetables = Types(name:"Verduras" , description: "Por si eres sano", numplats:2 , foodimg: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/04/22/10/istock-683044558.jpg?w968h681", arrRecipes: [vegetables1, vegetables2] )
        let salads1 = Recipes(recipeTitle : "Ensalada Stir-Fry", recipeDifficulty : "Básico", recipeImg: "https://www.cscassets.com/recipes/wide_cknew/wide_51129.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let salads2 = Recipes(recipeTitle : "Ensalada de raviolis y verdura", recipeDifficulty : "Medio", recipeImg: "http://relish.com/wp-content/uploads/2011/01/skillet_ravioli_final-655x405.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let salads = Types(name:"Ensaladas" , description: "Por si eres más sano todavía", numplats: 2, foodimg: "https://life-in-the-lofthouse.com/wp-content/uploads/2017/06/Chicken-Caesar-Salad4.gif", arrRecipes: [salads1, salads2] )
        let pasta1 = Recipes(recipeTitle : "Macarrones con tomate", recipeDifficulty : "Medio", recipeImg: "https://www.budgetbytes.com/wp-content/uploads/2013/07/Creamy-Tomato-and-Spinach-Pasta-skillet-1-380x380.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let pasta2 = Recipes(recipeTitle : "Lazos", recipeDifficulty : "Fácil", recipeImg: "https://shewearsmanyhats.com/wp-content/uploads/2009/08/creamy-pesto-pasta-new4.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let pasta = Types(name: "Pasta", description: "Mamma mia italiani style", numplats:2 , foodimg: "https://www.gallinablanca.es/files/thumbs/ef02623ee0bc71cfe62c1e82ee2f291948576d03_r900_480_2.jpg", arrRecipes: [pasta1, pasta2] )
        let soups1 = Recipes(recipeTitle : "Sopa TGB", recipeDifficulty : "Medio", recipeImg: "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/recipe-image-legacy-id-1074500_11.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let soups2 = Recipes(recipeTitle : "Sopa de pescado", recipeDifficulty : "Difícil", recipeImg: "https://www.simplyrecipes.com/wp-content/uploads/2016/02/dads-fish-stew-vertical-a-1600.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let soups = Types(name: "Sopas", description: "Sopitas que ni tu yaya", numplats: 2, foodimg: "https://www.seriouseats.com/recipes/images/2017/12/20171115-chicken-soup-vicky-wasik-11-1500x1125.jpg", arrRecipes: [soups1, soups2] )
        let desserts1 = Recipes(recipeTitle : "Tarta de chocolate blanco con oreo", recipeDifficulty : "Difícil", recipeImg: "http://static.kidspot.com.au/recipe_asset/1385/img-4962.jpg-20150505010814~q75,dx720y432u1r1gg,c--.jpg", recipeIngredients:  "Carne,Patatas,Salsa" )
        let desserts2 = Recipes(recipeTitle : "Tarta de naranja", recipeDifficulty : "Difícil", recipeImg: "https://hips.hearstapps.com/del.h-cdn.co/assets/17/06/1600x800/landscape-1486420115-delish-banana-pudding-poke-cake-11.jpg?resize=480:*", recipeIngredients:  "Carne,Patatas,Salsa" )
        let desserts = Types(name: "Postres", description: "Lo mehó de lo mehó", numplats: 2, foodimg: "https://images-gmi-pmc.edge-generalmills.com/817d708a-33e6-46f7-b985-0360b6c55cf4.jpg", arrRecipes: [desserts1, desserts2])
        
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
        cell.numberlabel?.text = String(type.numplats)
        cell.foodimg?.sd_setImage(with: URL(string: type.foodimg), completed: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let myCategory = types[indexPath.row]
        let recVC = RecipesListViewController(recypes: myCategory.arrRecipes)
        navigationController?.pushViewController(recVC, animated: true)
    }
}
