//
//  SizeViewController.swift
//  PizzaCreator
//
//  Created by Óscar Calles Sáez on 13/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import UIKit

class SizeViewController: UIViewController {
    
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var buttonImage: UIButton!
    
    var aPizza:Pizza = Pizza()
    
    @IBAction func buttonImagePressed(sender: AnyObject) {
        if aPizza.isPreparingPizza {
            aPizza.isPreparingPizza = false
        }
    }
    
    func initializeButton() {
        buttonImage.setTitle("Tamaño", forState: UIControlState.Normal)
        buttonImage.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        buttonImage.setImage(UIImage(named: "pizza_peq.png"), forState: UIControlState.Normal)

        aPizza.size = "Pequeña"
    }
    
    @IBAction func sizeSegmentedControlPressed(sender: UISegmentedControl) {
        switch sizeSegmentedControl.selectedSegmentIndex{
        case 0:
            buttonImage.setImage(UIImage(named: "pizza_peq.png"), forState: .Normal)
            aPizza.size = "Pequeña"
        case 1:
            buttonImage.setImage(UIImage(named: "pizza_med.png"), forState: .Normal)
            aPizza.size = "Mediana"
        case 2:
            buttonImage.setImage(UIImage(named: "pizza_gran.png"), forState: .Normal)
            aPizza.size = "Grande"
        default:
            break;
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if aPizza.isPreparingPizza {
            sizeSegmentedControl.selectedSegmentIndex=0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButton()
        self.navigationItem.title = "Tamaños"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destinationVC = segue.destinationViewController as? BaseViewController {
            destinationVC.aPizza = aPizza
        }
    }
}
