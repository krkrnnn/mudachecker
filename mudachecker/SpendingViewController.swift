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
    

    //出費一覧を表示するテーブルビュー
    @IBOutlet weak var spListView: UITableView!
    

    
    //出費を入れている配列
    var spList: [AnyObject] = []
    //var editRow: Int = unselectedRow
    
//    //出費項目を入れている配列
//    var koumokuList: [String] = []
//    
//    //出費金額を入れる配列
//    var spendingArray: [Int] = []
    
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
        
        spListView.registerNib(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        //tableView.registerNib(UINib(nibName: "SpendingTableViewCell", bundle: nil),
          //  forCellReuseIdentifier: "cell")
        //テキストフィールドのキーボードを数字に
        spendingText1.keyboardType = UIKeyboardType.NumberPad

        // Do any additional setup after loading the view.
        
        //合計値の保存値があったら採用
        if saveData.objectForKey("SPSUM") != nil {
            sum = saveData.objectForKey("SPSUM") as! Int
        }
        
        //一覧の保存値があったら採用
        if saveData.arrayForKey("SPLIST") != nil{
            spList = saveData.arrayForKey("SPLIST")!
        }
        
        //メモ参考追加 出費額
//        memoListView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        spendingText1.becomeFirstResponder()
//        
//        let defaults = NSUserDefaults.standardUserDefaults()
//        let loadedMemoList = defaults.objectForKey("MEMO_LIST")
//        if (loadedMemoList as? [String] != nil) {
//            memoList = loadedMemoList as! [String]
//        }
        
//        //メモ参考追加　品目
//        koumokuListView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell2")
//        koumokuText.becomeFirstResponder()
//        
//        let save = NSUserDefaults.standardUserDefaults()
//        let loadedKoumokuList = save.objectForKey("KOUMOKU_LIST")
//        if (loadedKoumokuList as? [String] != nil) {
//            memoList = loadedKoumokuList as! [String]
//        }

       

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
        
        
        
        //出費金額を配列に保存
        //spendingArray.append(spendinglValue1)
  
        
        //出費金額を配列に保存
        //saveData.setObject(spendingArray, forKey: "spArray")
        
        
    }
    
    //出費登録ボタンが押されたとき一覧に保存
    @IBAction func tapSubmitButton(sender: UIButton) {
        //applyMemo()
        
        
        let spendingArray =
        ["品目":koumokuText.text!, "値段":spendingText1.text!]
        
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
        return spList.count
    }
    
    //セルの中身の表示の仕方を設定
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SpendingTableViewCell
        
        let nowIndexPath: (AnyObject) = spList[indexPath.row]
        
        cell.koumokuLabel.text = nowIndexPath["品目"] as? String
        cell.spendingLabel.text = nowIndexPath["値段"] as? String

        
        return cell
    }
    
    
    //以下、メモ参考追加部分 項目どうする？
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return memoList.count
//    }
//   
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
//        if indexPath.row >= memoList.count {
//            return cell
//        }
//        
//        cell.textLabel?.text = memoList[indexPath.row]
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.row >= memoList.count {
//            return
//        }
//        editRow = indexPath.row
//        spendingText1.text = memoList[editRow]
//    }
//    
//    func textFieldShouldReturn(textField: UITextField) -> Bool {
//        applyMemo()
//        return true
//    }
//    
//    func applyMemo() {
//        if spendingText1.text == nil {
//            return
//        }
//        
//        if editRow == unselectedRow {
//            memoList.append(spendingText1.text!)
//        } else {
//            memoList[editRow] = spendingText1.text!
//        }
//        
//        let defaults = NSUserDefaults.standardUserDefaults()
//        defaults.setObject(memoList, forKey: "MEMO_LIST")
//        
//        spendingText1.text = ""
//        editRow = unselectedRow
//        memoListView.reloadData()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
