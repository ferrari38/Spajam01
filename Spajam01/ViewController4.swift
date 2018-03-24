//
//  ViewController4.swift
//  Spajam01
//
//  Created by KatsushiOhzawa on 2016/05/21.
//  Copyright © 2016年 KatsushiOhzawa. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    var url: String?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let encodedUrlString = url!.stringByAddingPercentEncodingWithAllowedCharacters( NSCharacterSet.URLQueryAllowedCharacterSet() )
        let tmpUrl = NSURL(string: encodedUrlString!)
        let request = NSURLRequest(URL: tmpUrl!)
        self.webView!.loadRequest(request)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
