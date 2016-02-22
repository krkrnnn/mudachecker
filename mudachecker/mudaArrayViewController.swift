//
//  mudaArrayViewController.swift
//  mudachecker
//
//  Created by 福田かるな on 2016/02/21.
//  Copyright © 2016年 net.karuna. All rights reserved.
//

import UIKit

class mudaArrayViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    //NSUerDefaultsインスタンスの生成
    let saveData = NSUserDefaults.standardUserDefaults()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //項目一覧が入っている配列のspArrayを呼び出す
        //String型に落として書き出し
        var spendingArray: [String] = saveData.objectForKey("spArray") as! [String]
        
        
        //配列の内容をString型に書き出す
        //var id: String = saveData.stringForKey("ID")!
        var id: String = ""
        for(var i = 0; i < spendingArray.count; i++){
            id = id + "\n" + spendingArray[i]
            
            //idをアプリ内に保存
            //saveData.setObject(id, forKey: "ID")
            
        }


        
        //配列の中身をラベルに表示
        //表示途中！！！！！
        label = UILabel(frame: CGRectMake(0,0,120,0)) //高さをゼロに
        //ラベルに配列の内容を表示
        label.text = id

        label.backgroundColor = UIColor.redColor()
        label.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
        // 行数無制限
        label.numberOfLines = 0;
        // サイズを自動調整
        label.sizeToFit()
        
        self.view.addSubview(label)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
