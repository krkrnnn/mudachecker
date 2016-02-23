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
        
//        if saveData.objectForKey("RESET") != nil{
//            reset = saveData.objectForKey("RESET") as! Int
//        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //出費登録ボタン
    @IBAction func spendingRegisterButtonTapped(){
        

        
        //出費金額をInt型で取得
        spendinglValue1 = Int(spendingText1.text!)!

        
        //入力した合計値を計算
//        if(reset == 1){
//            sum = 0
//        }
        
        //出費合計
        sum = sum + spendinglValue1
        
        //出費合計金額を保存
        saveData.setObject(sum, forKey: "SPSUM")
        
        //目標値とのオーバー金額を計算
        //var mudaValue = sum - saveData.integerForKey("GOAL")
        
        //無駄金額を保存
        //saveData.setObject(mudaValue, forKey: "MUDA")

//        
//        reset = 0
//        saveData.setObject(reset, forKey: "RESET")
        
        
        //出費金額を配列に保存
        spendingArray.append(spendinglValue1)
  
        
        //出費金額を配列に保存
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
