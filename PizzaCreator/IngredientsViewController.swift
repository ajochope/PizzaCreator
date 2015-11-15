//
//  IngredientsViewController.swift
//  PizzaCreator
//
//  Created by Óscar Calles Sáez on 13/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var aPizza:Pizza!
    
    var arrayIngredients =
    ["Jamón","Pepperoni","Pavo","Salchicha","Aceituna",
     "Cebolla","Pimiento","Piña","Anchoa","Doble queso",
     "Jamón","Pepperoni","Pavo","Salchicha","Aceituna",
     "Cebolla","Pimiento","Piña","Anchoa","Doble queso",
     " Jamón","Pepperoni","Pavo","Salchicha","Aceituna",
     "Cebolla","Pimiento","Piña","Anchoa","Doble queso",
     "Jamón","Pepperoni","Pavo","Salchicha","Aceituna",
     "Cebolla","Pimiento","Piña","Anchoa","Doble queso"]
    
    var numberOfIngredents=0
    var selectedPickerRow=0
    
    private var arrayOfLabels:[UILabel] = []
    private var arrayIngredientsSelected:[String] = []
    
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var labelIngredient1: UILabel!
    @IBOutlet weak var labelIngredient2: UILabel!
    @IBOutlet weak var labelIngredient3: UILabel!
    @IBOutlet weak var labelIngredient4: UILabel!
    @IBOutlet weak var labelIngredient5: UILabel!
    @IBOutlet weak var pickerIngredients: UIPickerView!
    
    @IBAction func buttonAddPressed(sender: UIButton) {
        if numberOfIngredents < 5 {
            let label = arrayOfLabels[numberOfIngredents]
            label.text = arrayIngredients[selectedPickerRow]
            arrayIngredientsSelected.append(arrayIngredients[selectedPickerRow])
            aPizza!.arrayIngredientsSelected = arrayIngredientsSelected
            numberOfIngredents++
        }
        if numberOfIngredents == 5 {
            buttonAdd.enabled = false
        }
    }
    
    func setPizzaLabels() {
        if !aPizza!.arrayIngredientsSelected.isEmpty {
            for (var i=0; i<aPizza!.arrayIngredientsSelected.count; i++){
                arrayOfLabels[i].text = aPizza!.arrayIngredientsSelected[i]
            }
        }
    }
    
    @IBAction func buttonNextPressed(sender: UIButton) {
        
        
    }
    
    func loadArrayOfLabels() {
        self.navigationItem.title = "Ingredientes"
        arrayOfLabels.append(labelIngredient1)
        arrayOfLabels.append(labelIngredient2)
        arrayOfLabels.append(labelIngredient3)
        arrayOfLabels.append(labelIngredient4)
        arrayOfLabels.append(labelIngredient5)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayIngredients[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayIngredients.count
    }

    internal func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPickerRow=row
    }
    
    override func viewWillAppear(animated: Bool) {
        if aPizza.isPreparingPizza {
            for item in arrayOfLabels {
                item.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadArrayOfLabels()
        setPizzaLabels()
//        print(aPizza.size)
//        print(aPizza.base)
//        print(aPizza.chesse)
        pickerIngredients.selectRow(arrayIngredients.count/2,
                                    inComponent: 0,
                                    animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? ConfirmationViewController {
            destinationVC.aPizza = aPizza
        }
    }
}
