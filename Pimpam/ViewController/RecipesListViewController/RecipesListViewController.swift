//
//  RecipesListViewController.swift
//  Pimpam
//
//  Created by SEBASTIÁN TANGARIFE ACERO on 28/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit
import SDWebImage
class RecipesListViewController: UIViewController {
    @IBOutlet weak var listrecipes : UITableView!
    internal var recypes: [Recipes] = []
    

    convenience init(recypes:[Recipes]){
        self.init()
        self.recypes = recypes
    }
    
    private func registerCells(){
        let identifier = "RecipesCell"
        let cellNib = UINib(nibName: identifier, bundle: nil)
        listrecipes.register(cellNib, forCellReuseIdentifier: "RecipesCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("Categorias", comment: "")
        registerCells()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension RecipesListViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recypes.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipesCell = (tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) as? RecipesCell)!
         let actore = recypes[indexPath.row]
        cell.titlelabel?.text = actore.name
        cell.difficultlabel?.text = actore.difficult
        cell.foodrecipeimg?.sd_setImage(with: URL(string: actore.foodrecipesimg), completed: nil)
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recVC = RecipesListViewController()
        navigationController?.pushViewController(recVC, animated: true)
    }
    
    
}

