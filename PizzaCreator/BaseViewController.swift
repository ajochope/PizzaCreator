//
//  BaseViewController.swift
//  PizzaCreator
//
//  Created by Óscar Calles Sáez on 13/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var aPizza:Pizza!
    
    @IBOutlet weak var buttonBaseImage: UIButton!
    @IBOutlet weak var baseSegmentedControl: UISegmentedControl!
    
    func initializeButton() {
        buttonBaseImage.setTitle("Tipo", forState: UIControlState.Normal)
        buttonBaseImage.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonBaseImage.setImage(UIImage(named: "pizza_delg.png"), forState: UIControlState.Normal)
        
        aPizza.base = "Delgada"
    }
    
    @IBAction func baseSegmentedPressed(sender: UISegmentedControl) {
        
        switch baseSegmentedControl.selectedSegmentIndex{
        case 0:
            buttonBaseImage.setImage(UIImage(named: "pizza_delg.png"), forState: .Normal)
            aPizza!.base = "Delgada"
            aPizza!.baseSegmented = 0
        case 1:
            buttonBaseImage.setImage(UIImage(named: "pizza_cruj.png"), forState: .Normal)
            aPizza!.base = "Crujiente"
            aPizza!.baseSegmented = 1
        case 2:
            buttonBaseImage.setImage(UIImage(named: "pizza_gru.png"), forState: .Normal)
            aPizza!.base = "Gruesa"
            aPizza!.baseSegmented = 2
        default:
            break;
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if aPizza.isPreparingPizza {
           baseSegmentedControl.selectedSegmentIndex=0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButton()
        self.navigationItem.title = "Bases"
        baseSegmentedControl.selectedSegmentIndex=aPizza!.baseSegmented
        //print(aPizza.size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? CheeseViewController {
            destinationVC.aPizza = aPizza
        }
    }
}
