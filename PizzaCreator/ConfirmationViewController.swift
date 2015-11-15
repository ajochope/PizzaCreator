//
//  ConfirmationViewController.swift
//  PizzaCreator
//
//  Created by Óscar Calles Sáez on 13/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {
    var aPizza:Pizza!
    
    @IBOutlet weak var labelSize: UILabel!
    @IBOutlet weak var labelBase: UILabel!
    @IBOutlet weak var labelCheese: UILabel!
    @IBOutlet weak var labelIngredient1: UILabel!
    @IBOutlet weak var labelIngredient2: UILabel!
    @IBOutlet weak var labelIngredient3: UILabel!
    @IBOutlet weak var labelIngredient4: UILabel!
    @IBOutlet weak var labelIngredient5: UILabel!
    
    private var arrayOfLabels:[UILabel] = []
    
    @IBAction func resetPizzaPressed(sender: UIButton) {
        for item in arrayOfLabels {
            item.text = ""
        }
        labelSize.text = ""
        labelBase.text = ""
        labelCheese.text = ""
        aPizza.isPreparingPizza = true
        aPizza.arrayIngredientsSelected = []
        aPizza.sizeSegmented=0
        aPizza.baseSegmented=0
        aPizza.chesseSegmented=0

    }
    
    func loadArrayOfLabels() {
        arrayOfLabels.append(labelIngredient1)
        arrayOfLabels.append(labelIngredient2)
        arrayOfLabels.append(labelIngredient3)
        arrayOfLabels.append(labelIngredient4)
        arrayOfLabels.append(labelIngredient5)
    }
    
    func setPizzaLabels() {
        labelSize.text = aPizza!.size
        labelBase.text = aPizza!.base
        labelCheese.text = aPizza!.chesse
        if !aPizza!.arrayIngredientsSelected.isEmpty {
            for (var i=0; i<aPizza!.arrayIngredientsSelected.count; i++){
                arrayOfLabels[i].text = aPizza!.arrayIngredientsSelected[i]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Confirmar pizza"
        loadArrayOfLabels()
        setPizzaLabels()
//        print(aPizza.size)
//        print(aPizza.base)
//        print(aPizza.chesse)
//        print(aPizza.arrayIngredientsSelected)
    }

    override func viewWillAppear(animated: Bool) {
        setPizzaLabels()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
