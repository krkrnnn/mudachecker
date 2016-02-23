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

    //出費一覧を表示するテーブルビュー
    @IBOutlet weak var memoListView: UITableView!
    
    var memoList: [String] = []
    var editRow: Int = unselectedRow
    
    //出費金額を入れる配列
    var spendingArray: [Int] = []
    
    //NSUerDefaultsインスタンスの生成
    let saveData : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    //出費金額
    var spendinglValue1 :Int = 0

    
    //出費合計金額
    var sum : Int = 0
    
    //リセットボタンがおされたかどうか
    var reset: Int = 0
    


    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        
        if saveData.objectForKey("SPSUM") != nil {
            sum = saveData.objectForKey("SPSUM") as! Int
        }
        
        //メモ参考追加
        memoListView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        spendingText1.becomeFirstResponder()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let loadedMemoList = defaults.objectForKey("MEMO_LIST")
        if (loadedMemoList as? [String] != nil) {
            memoList = loadedMemoList as! [String]
        }

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
        spendingArray.append(spendinglValue1)
  
        
        //出費金額を配列に保存
        saveData.setObject(spendingArray, forKey: "spArray")
        
        
    }
    
    //出費登録ボタンが押されたとき一覧に保存
    @IBAction func tapSubmitButton(sender: UIButton) {
        applyMemo()
    }
    
    
    //以下、メモ参考追加部分
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if indexPath.row >= memoList.count {
            return cell
        }
        
        cell.textLabel?.text = memoList[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row >= memoList.count {
            return
        }
        editRow = indexPath.row
        spendingText1.text = memoList[editRow]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        applyMemo()
        return true
    }
    
    func applyMemo() {
        if spendingText1.text == nil {
            return
        }
        
        if editRow == unselectedRow {
            memoList.append(spendingText1.text!)
        } else {
            memoList[editRow] = spendingText1.text!
        }
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(memoList, forKey: "MEMO_LIST")
        
        spendingText1.text = ""
        editRow = unselectedRow
        memoListView.reloadData()
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
