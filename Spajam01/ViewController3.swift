//
//  ViewController3.swift
//  Spajam01
//
//  Created by KatsushiOhzawa on 2016/05/21.
//  Copyright © 2016年 KatsushiOhzawa. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    struct MyData {
        var kind: String
        var name: String
        var time: Int
        var cal: Int
        var url: String
        
        
        init(kind: String, name: String, time: Int, cal: Int, url: String) {
            self.kind = kind
            self.name = name
            self.time = time
            self.cal = cal
            self.url = url
        }
    }
    
    // Table View Outlet接続
    @IBOutlet weak var tableView: UITableView!
    
    var tmpNum: Int?
    var toUrl: String?
    var seasonFlag: Bool?
    var seasonNum: Int?
    var kindFlag = [Bool]() //肉, 魚, 野菜, ご飯,　お味噌汁
    var allData = [MyData]()
    var viewData = [MyData]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.init(red: 0.99, green: 0.92, blue: 0.88, alpha: 1.0)
        self.tableView.backgroundColor = UIColor.init(red: 0.99, green: 0.92, blue: 0.88, alpha: 1.0)
        
        self.navigationItem.title = "レシピ一覧"
        
        
        //現在の月を取得
        let cal = NSCalendar(identifier: NSCalendarIdentifierGregorian)!
        let now = NSDate()
        let month: String = String(cal.component(.Month, fromDate: now))
        switch month {
        case "1":
            seasonNum = 4
        case "2":
            seasonNum = 4
        case "3":
            seasonNum = 1
        case "4":
            seasonNum = 1
        case "5":
            seasonNum = 1
        case "6":
            seasonNum = 2
        case "7":
            seasonNum = 2
        case "8":
            seasonNum = 2
        case "9":
            seasonNum = 3
        case "10":
            seasonNum = 3
        case "11":
            seasonNum = 3
        case "12":
            seasonNum = 4
        default:
            seasonNum = 0
        }
        
        // sample.txtファイルを読み込み
        // 料理の種類, 料理名, 調理時間, kCal, URL, 季節
        
        var tmpText :String?
        
        let path = NSBundle.mainBundle().pathForResource("data", ofType: "txt")!
        if let data = NSData(contentsOfFile: path){
            tmpText = String(NSString(data: data, encoding: NSUTF8StringEncoding)!)
        }else{
            tmpText = "データなし"
        }
        
        //改行コード "," で分割
        //季節あり
        if(seasonFlag == true) {
            var arr1 = [MyData]()
            var arr2 = [MyData]()
            tmpText!.enumerateLines { (line, stop) -> () in
                var text = line.componentsSeparatedByString(",")
                if(Int(text[5]) == self.seasonNum) {
                    arr1.append(MyData(kind: text[0], name: text[1],
                        time: Int(text[2])!, cal: Int(text[3])!, url: text[4]))
                }
                else {
                    arr2.append(MyData(kind: text[0], name: text[1],
                        time: Int(text[2])!, cal: Int(text[3])!, url: text[4]))
                }
            }
            self.allData = arr1 + arr2
        }
        //季節なし
        else {
            tmpText!.enumerateLines { (line, stop) -> () in
                var text = line.componentsSeparatedByString(",")
                self.allData.append(MyData(kind: text[0], name: text[1],
                    time: Int(text[2])!, cal: Int(text[3])!, url: text[4]))
            }
        }
        
        //季節で絞り込み
        var arr = [MyData]()
        for i in 0..<allData.count {
            if(allData[i].kind == "肉" && kindFlag[0] == true) {
                arr.append(allData[i])
            }
            else if(allData[i].kind == "魚" && kindFlag[1] == true) {
                arr.append(allData[i])
            }
            else if(allData[i].kind == "野菜(小皿)" && kindFlag[2] == true) {
                arr.append(allData[i])
            }
            else if(allData[i].kind == "ご飯" && kindFlag[3] == true) {
                arr.append(allData[i])
            }
            else if(allData[i].kind == "汁物" && kindFlag[4] == true) {
                arr.append(allData[i])
            }
        }
        allData = arr
        
        
        //カロリーで絞り込み
        var minNum = 0
        var maxNum = 0
        if(tmpNum == 0) {
            minNum = 0
            maxNum = 200
        }
        else if(tmpNum == 1) {
            minNum = 200
            maxNum = 400
        }
        else if(tmpNum == 2) {
            minNum = 400
            maxNum = 600
        }
        else if(tmpNum == 3) {
            minNum = 600
            maxNum = 800
        }
        else if(tmpNum == 4) {
            minNum = 800
            maxNum = 1000
        }
        
        for i in 0..<allData.count {
            if(allData[i].cal >= minNum && maxNum >= allData[i].cal) {
                viewData.append(allData[i])
            }
        }
        
        // Table View の設定
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Table View セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    // Table View セルのテキストを追加
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.backgroundColor = UIColor.init(red: 0.99, green: 0.92, blue: 0.88, alpha: 1.0)
        cell.textLabel?.text = viewData[indexPath.row].name+"("+String(viewData[indexPath.row].cal)+"kCal)"
        var text = viewData[indexPath.row].url.componentsSeparatedByString("http://park.ajinomoto.co.jp/recipe/card/")
        cell.imageView?.image = UIImage(named: text[1]+".jpg")
        return cell
    }
    
    // Table View セルがタップされた時
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        toUrl = viewData[indexPath.row].url
        if toUrl != nil {
            performSegueWithIdentifier("toViewController4",sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toViewController4") {
            let viewController4: ViewController4 = (segue.destinationViewController as? ViewController4)!
            viewController4.url = toUrl
            
        }
    }
    
    

}
