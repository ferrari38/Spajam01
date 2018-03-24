//
//  ViewController.swift
//  Spajam01
//
//  Created by KatsushiOhzawa on 2016/05/21.
//  Copyright © 2016年 KatsushiOhzawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView01: UIImageView!
    @IBOutlet weak var imageView02: UIImageView!
    @IBOutlet weak var imageView03: UIImageView!
    @IBOutlet weak var imageView04: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.init(red: 0.99, green: 0.92, blue: 0.88, alpha: 1.0)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background1.jpg")!)
        
        imageView03.image = UIImage(named: "Pacman_OBJ_target.png")
        imageView04.image = UIImage(named: "Pacman_OBJ_coffeeBreak.png")
        
        
        
        let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let now = NSDate()
        let month: String = String(cal.component(.Month, fromDate: now))
        
        switch month {
        case "1":
            imageView01.image = UIImage(named: "winter1.png")
            imageView02.image = UIImage(named: "winter1.png")
        case "2":
            imageView01.image = UIImage(named: "winter1.png")
            imageView02.image = UIImage(named: "winter1.png")
        case "3":
            imageView01.image = UIImage(named: "spring1.png")
            imageView02.image = UIImage(named: "spring1.png")
        case "4":
            imageView01.image = UIImage(named: "spring1.png")
            imageView02.image = UIImage(named: "spring1.png")
        case "5":
            imageView01.image = UIImage(named: "spring2.png")
            imageView02.image = UIImage(named: "spring3.png")
        case "6":
            imageView01.image = UIImage(named: "summer1.png")
            imageView02.image = UIImage(named: "summer1.png")
        case "7":
            imageView01.image = UIImage(named: "summer1.png")
            imageView02.image = UIImage(named: "summer1.png")
        case "8":
            imageView01.image = UIImage(named: "summer1.png")
            imageView02.image = UIImage(named: "summer1.png")
        case "9":
            imageView01.image = UIImage(named: "autum1.png")
            imageView02.image = UIImage(named: "autum1.png")
        case "10":
            imageView01.image = UIImage(named: "autum1.png")
            imageView02.image = UIImage(named: "autum1.png")
        case "11":
            imageView01.image = UIImage(named: "autum1.png")
            imageView02.image = UIImage(named: "autum1.png")
        case "12":
            imageView01.image = UIImage(named: "winter1.png")
            imageView02.image = UIImage(named: "winter1.png")
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

