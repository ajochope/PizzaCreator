//
//  Pizza.swift
//  PizzaCreator
//
//  Created by Óscar Calles Sáez on 13/11/15.
//  Copyright © 2015 Óscar Calles Sáez. All rights reserved.
//

import UIKit

class Pizza: NSObject {

    var size: String = ""
    var base: String = ""
    var chesse: String = ""
    var arrayIngredientsSelected:[String] = []
    var isPreparingPizza = false
    var sizeSegmented=0
    var baseSegmented=0
    var chesseSegmented=0
}
