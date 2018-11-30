//
//  SingleRecipeViewController.swift
//  Pimpam
//
//  Created by IGNACIO OLAGORTA VERA on 29/11/18.
//  Copyright © 2018 SEBASTIÁN TANGARIFE ACERO. All rights reserved.
//

import UIKit


class SingleRecipeViewController: UIViewController {
    var recypes:Recipes!
    @IBOutlet weak var singleRecipeImg : UIImageView!
    @IBOutlet weak var singleNameLbl : UILabel!
    @IBOutlet weak var singleIngredientsLbl : UILabel!
    @IBOutlet weak var singleDifficultyLbl : UILabel!
    
    convenience init(recypes:Recipes){
        self.init()
        self.recypes = recypes
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        singleNameLbl.text = recypes.recipeTitle
        singleDifficultyLbl.text = recypes.recipeDifficulty
        singleIngredientsLbl.text = recypes.recipeIngredients
        singleRecipeImg?.sd_setImage(with: URL(string: recypes.recipeImg)!, completed: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPreessed(){
        let recVC = MapViewController()
        navigationController?.pushViewController(recVC, animated: true)
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
