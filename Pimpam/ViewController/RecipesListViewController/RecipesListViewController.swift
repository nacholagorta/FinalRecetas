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
    internal var recipesFiltered: [Recipes] = []
    let searchController = UISearchController(searchResultsController: nil)

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
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search..."
        searchController.searchBar.backgroundColor = UIColor.white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    internal func searchBarIsEmpty() -> Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    internal func isFiltering() -> Bool{
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    internal func filterContentForSearchText(_ searchText: String){
        recipesFiltered = recypes.filter({ (xRecipes: Recipes ) -> Bool in
            return (xRecipes.recipeTitle.lowercased().contains(searchText.lowercased()))
        })
        listrecipes.reloadData()
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
        if isFiltering(){
            return recipesFiltered.count
        }
        else{
            return recypes.count
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 120.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipesCell = (tableView.dequeueReusableCell(withIdentifier: "RecipesCell", for: indexPath) as? RecipesCell)!
        if isFiltering(){
            let recipe = recipesFiltered[indexPath.row]
            cell.titlelabel?.text = recipe.recipeTitle
            cell.difficultlabel?.text = recipe.recipeDifficulty
            cell.foodrecipeimg?.sd_setImage(with: URL(string: recipe.recipeImg), completed: nil)
        }
        else{
            let recipe = recypes[indexPath.row]
            cell.titlelabel?.text = recipe.recipeTitle
            cell.difficultlabel?.text = recipe.recipeDifficulty
            cell.foodrecipeimg?.sd_setImage(with: URL(string: recipe.recipeImg), completed: nil)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let myRecepies = recypes[indexPath.row]
        let recVC = SingleRecipeViewController(recypes: myRecepies)
        navigationController?.pushViewController(recVC, animated: true)
    }
}
extension RecipesListViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
