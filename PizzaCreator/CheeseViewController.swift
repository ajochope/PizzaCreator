//
//  CheeseViewController.swift
//  PizzaCreator
//
//  Created by Óscar Calles Sáez on 13/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import UIKit

class CheeseViewController: UIViewController {

    var aPizza:Pizza!
    
    @IBOutlet weak var chesseSegmentedControl: UISegmentedControl!
    
    @IBAction func chesseSegmentedControlPressed(sender: UISegmentedControl) {
        switch chesseSegmentedControl.selectedSegmentIndex{
        case 0:
            buttonChesseImage.setImage(UIImage(named: "chesse_moza.png"), forState: .Normal)
            aPizza!.chesse = "Mozarela"
            aPizza!.chesseSegmented=0
        case 1:
            buttonChesseImage.setImage(UIImage(named: "chesse_ched.png"), forState: .Normal)
           aPizza!.chesse = "Cheddar"
            aPizza!.chesseSegmented=1
        case 2:
            buttonChesseImage.setImage(UIImage(named: "chesse_parm.png"), forState: .Normal)
            aPizza!.chesse = "Parmesano"
            aPizza!.chesseSegmented=2
        case 3:
            buttonChesseImage.setImage(UIImage(named: "chesse_not.png"), forState: .Normal)
            aPizza!.chesse = "No queso"
            aPizza!.chesseSegmented=3
        default:
            break;
        }
    }
    
    @IBOutlet weak var buttonChesseImage: UIButton!
    func initializeButton() {
        buttonChesseImage.setTitle("Chesse", forState: UIControlState.Normal)
        buttonChesseImage.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonChesseImage.setImage(UIImage(named: "chesse_moza.png"), forState: UIControlState.Normal)
        
        aPizza.chesse = "Mozzarella"
    }
    
    override func viewWillAppear(animated: Bool) {
        if aPizza.isPreparingPizza {
            chesseSegmentedControl.selectedSegmentIndex=0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButton()
        self.navigationItem.title = "Quesos"
        chesseSegmentedControl.selectedSegmentIndex=aPizza!.chesseSegmented
//        print(aPizza.size)
//        print(aPizza.base)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? IngredientsViewController {
            destinationVC.aPizza = aPizza
        }
    }
}
