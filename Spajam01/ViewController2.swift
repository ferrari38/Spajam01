//
//  ViewController2.swift
//  Spajam01
//
//  Created by KatsushiOhzawa on 2016/05/21.
//  Copyright © 2016年 KatsushiOhzawa. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //PickerView outlet接続
    @IBOutlet weak var pickerView01: UIPickerView!
    
    //Table View Outlet接続
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var switch01: UISwitch!
    @IBOutlet weak var switch02: UISwitch!
    @IBOutlet weak var switch03: UISwitch!
    @IBOutlet weak var switch04: UISwitch!
    @IBOutlet weak var switch05: UISwitch!
    @IBOutlet weak var switch10: UISwitch!
    
    var pickerNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.init(red: 0.99, green: 0.92, blue: 0.88, alpha: 1.0)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.jpg")!)
        
        self.navigationItem.title = "レシピ検索"
        
        pickerView01.dataSource = self
        pickerView01.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var pickerArr: NSArray = ["0 ~ 200(kCal)","200 ~ 400(kCal)","400 ~ 600(kCal)","600 ~ 800(kCal)","800 ~ 1000(kCal)"]
    
    // Picker View の列数=1
    func numberOfComponentsInPickerView(pickerview1: UIPickerView) -> Int {
        return 1
    }
    
    // Picker View の表示個数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArr.count
    }
    
    // Picker View に表示する文字列
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArr[row] as? String
    }
    
    // Picker View で選択されたときに実行する処理
    func pickerView(pickerview1: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerNum = row
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "toViewController3") {
            let viewController3 = segue.destinationViewController as! ViewController3
            viewController3.tmpNum = pickerNum
            viewController3.kindFlag.append(switch01.on)
            viewController3.kindFlag.append(switch02.on)
            viewController3.kindFlag.append(switch03.on)
            viewController3.kindFlag.append(switch04.on)
            viewController3.kindFlag.append(switch05.on)
            viewController3.seasonFlag = switch10.on
        }
        
    }
    
}
