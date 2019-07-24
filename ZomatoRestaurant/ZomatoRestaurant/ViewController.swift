//
//  ViewController.swift
//  ZomatoRestaurant
//
//  Created by vikas on 21/07/19.
//  Copyright © 2019 project1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dish: [String] = []
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        pickerView.dataSource = (self as! UIPickerViewDataSource)
//        pickerView.delegate = (self as! UIPickerViewDelegate)
        
        ZomatoApi.categoriesList(completionHandler: handleRestuarentList(dish:error:))
    }
    
    func handleRestuarentList(dish: [String], error: Error?) {
        self.dish = dish
        DispatchQueue.main.async {
            self.pickerView.reloadAllComponents()
        }
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dish.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dish[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
}

