//
//  IndexViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/16.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController {
    
    //NSUerDefaultsインスタンスの生成
    let saveData = NSUserDefaults.standardUserDefaults()
    
    //項目を入力するテキストフィールド
    @IBOutlet var ItemText: UITextField!
    
    //入力された項目をString型で保存
    var Index: String = ""
    
    //出費項目を保存した配列
    var spendingItemArray:[String] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func indexRegister(){
        //テキストに入力された項目をIndexというString型の変数に入れる
        Index = ItemText.text!
        
        //項目を配列に追加する
        spendingItemArray.append(Index)
        
        //配列の内容をアプリ上に保存する
        //キーはidArray
        saveData.setObject(spendingItemArray, forKey: "idArray")
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
