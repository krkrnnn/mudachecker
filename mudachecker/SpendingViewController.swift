//
//  SpendingViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/16.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

private let unselectedRow = -1

class SpendingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    //出費金額を入力するフィールド
    @IBOutlet var spendingText1: UITextField!
    
    //出費項目を入力するフィールド
    @IBOutlet var koumokuText: UITextField!
    
    //年を入力するフィールド
    @IBOutlet var yearText: UITextField!
    
    //月を入力するフィールド
    @IBOutlet var monthText: UITextField!
    
    //日を入力するフィールド
    @IBOutlet var dayText: UITextField!
    
    

    //出費一覧を表示するテーブルビュー
    @IBOutlet weak var spListView: UITableView!
    

    
    //出費を入れている配列
    var spList: [AnyObject] = []
    //var editRow: Int = unselectedRow
    

    
    //NSUerDefaultsインスタンスの生成
    let saveData = NSUserDefaults.standardUserDefaults()
    
    //出費金額
    var spendinglValue1 :Int = 0

    
    //出費合計金額
    var sum : Int = 0
    
    //リセットボタンがおされたかどうか
    var reset: Int = 0
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //日付の取得
        let now = NSDate() // 現在日時の取得
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")  // JPロケール
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") // ロケールの設定
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss" // 日付フォーマットの設定
        
        
        spListView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //テキストフィールドのキーボードを数字に
        spendingText1.keyboardType = UIKeyboardType.NumberPad
        yearText.keyboardType = UIKeyboardType.NumberPad
        monthText.keyboardType = UIKeyboardType.NumberPad
        dayText.keyboardType = UIKeyboardType.NumberPad

        // Do any additional setup after loading the view.
        
        //合計値の保存値があったら採用
        if saveData.objectForKey("SPSUM") != nil {
            sum = saveData.objectForKey("SPSUM") as! Int
        }
        
        //一覧の保存値があったら採用
        if saveData.arrayForKey("SPLIST") != nil{
            spList = saveData.arrayForKey("SPLIST")!
        }
        
       

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("SPEND") != nil{
            spList = saveData.arrayForKey("SPEND")!
        }
        spListView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //出費登録ボタン
    @IBAction func spendingRegisterButtonTapped(){
        

        
        //出費金額をInt型で取得
        spendinglValue1 = Int(spendingText1.text!)!

        
        //出費合計
        sum = sum + spendinglValue1
        
        //出費合計金額を保存
        saveData.setObject(sum, forKey: "SPSUM")
        
        
    }
    
    //出費登録ボタンが押されたとき一覧に保存
    @IBAction func tapSubmitButton(sender: UIButton) {
        

        
        let date = NSDate()
        let cal = NSCalendar(identifier: NSGregorianCalendar)
        let comps = cal!.components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day,NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second],fromDate: date)
        var year = String(comps.year)
        var month = String(comps.month)
        var day = String(comps.day)
        
        
        if yearText.text != ""{
            year = yearText.text!
        }
        if monthText.text != ""{
            month = monthText.text!
        }
        if dayText.text != ""{
            day = dayText.text!
        }
        
        let spendingArray =
        ["品目":"\(year)" + "年 " + "\(month)" + "月 " + "\(day)" + "日  " + koumokuText.text!, "値段":spendingText1.text!]

        
        spList.append(spendingArray)
        saveData.setObject(spList, forKey: "SPEND")
        
        //保存完了のポップアップ表示
        let alert = UIAlertController(
            title: "保存完了",
            message: "出費の保存が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertActionStyle.Default,
                handler: nil
            )
        )
        self.presentViewController(alert, animated: true, completion: nil)
        spendingText1.text = ""
        koumokuText.text = ""

    }
    
    
    //セクションの数を設定する
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの個数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        return spList.count //上下を追加するから３倍
    }
    
    
    //セルの中身の表示の仕方を設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SpendingTableViewCell
        
        let nowIndexPath: (AnyObject) = spList[indexPath.row]
        
        cell.koumokuLabel.text = nowIndexPath["品目"] as? String
        cell.spendingLabel.text = nowIndexPath["値段"] as? String

        
        return cell
    }
    
    //スワイプしてCellを削除
    func tableView(tableView: UITableView,canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            spList.removeAtIndex(indexPath.row)
            //配列を再び保存
            saveData.setObject(spList, forKey: "SPEND")
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
