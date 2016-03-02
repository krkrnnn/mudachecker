//
//  MonthMudaViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/16.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class MonthMudaViewController: UIViewController {
    
    
    //オーバー額を表示するラベル
    @IBOutlet var mudaLabel: UILabel!
    
    //出費金額の合計
    var spTotal :Int = 0
    
    //無駄金額の合計
    var mudaTotal: Int = 0
    //リセットボタンが押されたかどうか
    var resetButton: Int = 0
    
    
    //NSUerDefaultsインスタンスの生成
    let saveData : NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //var spArray = saveData.integerForKey("spArray")
        //var spArrar[0]
        
        
        //ムダ金額を取得
        if saveData.objectForKey("SPSUM") != nil{
            spTotal = saveData.objectForKey("SPSUM") as! Int
        }
        
        //mudaTotalがnilかどうか判別
        if saveData.objectForKey("GOAL") != nil{
            mudaTotal = spTotal - (saveData.objectForKey("GOAL") as! Int)
        }
        
        if mudaTotal > 0{
            mudaLabel.numberOfLines = 2
            //目標をオーバーした出費の額を表示
            mudaLabel.text = String(mudaTotal) + "円" + "\n" + "ムダ遣いしています"
        }else{
            mudaLabel.numberOfLines = 2
            //目標をオーバーしていなかったときの出費の額を表示
            mudaLabel.text = "0円ムダ遣いしています"
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ResetButtonTapped(){
        
        //出費金額を0円に書き換える
        var sum: Int = 0
       
       saveData.setObject(sum, forKey: "SPSUM")
        mudaLabel.numberOfLines = 2
        //目標をオーバーした出費の額を表示
        //mudaLabel.text =   String(saveData.objectForKey("MUDA")) + "\n" + "円ムダ遣いしています"
        mudaLabel.text = "0円ムダ遣いしています"
        
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
