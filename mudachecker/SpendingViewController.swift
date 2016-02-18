//
//  SpendingViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/16.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class SpendingViewController: UIViewController {
    
    //出費金額を入力するフィールド
    @IBOutlet var spendingText1: UITextField!
    @IBOutlet var spendingText2: UITextField!
    @IBOutlet var spendingText3: UITextField!
    
    
    //出費金額を入れる配列
    var spendingArray: [Int] = []
    
    //NSUerDefaultsインスタンスの生成
    let saveData = NSUserDefaults.standardUserDefaults()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //出費登録ボタン
    @IBAction func spendingRegisterButtonTapped(){
        
        //出費金額をInt型で取得
        let spendinglValue1: Int? = Int(spendingText1.text!)
        let spendinglValue2: Int? = Int(spendingText2.text!)
        let spendinglValue3: Int? = Int(spendingText3.text!)
        
        
        //入力した出費の合計値を保存する
        var spendingSum : Int! = 0
        
        //入力した合計値を計算
        //３つの欄を全て埋めないとエラー発生
        spendingSum = spendinglValue1! + spendinglValue2! + spendinglValue3!
        
        //目標値とのオーバー金額を計算
        var mudaValue = spendingSum - saveData.integerForKey("GOAL")
        if mudaValue < 0 {
            //もしオーバーしてなかったらむだ遣い金額は0円
            mudaValue = 0
        }
        
        //無駄金額を保存
        saveData.setObject(mudaValue, forKey: "MUDA")
        
        
        //出費金額を配列に保存
        spendingArray.append(spendinglValue1!)
        spendingArray.append(spendinglValue2!)
        spendingArray.append(spendinglValue3!)
        
        //出費金額を保存
        saveData.setObject(spendingArray, forKey: "spArray")
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
