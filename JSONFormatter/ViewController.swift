//
//  ViewController.swift
//  JSONFormatter
//
//  Created by 王贤玉 on 2018/1/10.
//  Copyright © 2018年 wxy. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var prettybtn: NSButton!
    
    @IBOutlet var contentTextView: NSTextView!
    @IBOutlet weak var generateBtn: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
    @IBAction func clearAction(_ sender: Any) {
        contentTextView.textStorage?.setAttributedString(NSAttributedString.init(string: ""))
    }
    

    @IBAction func prettyAction(_ sender: Any) {
        var content:String = "格式不正确"
        if let data = contentTextView.textStorage?.string.data(using: .utf8){
            do{
                let obj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                let objData = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                content = String.init(data: objData, encoding:.utf8) ?? ""
                
            }catch{
                
            }
        }
        contentTextView.textStorage?.setAttributedString(NSAttributedString.init(string: content))
    }

    @IBAction func generateAction(_ sender: Any) {
        
        if let data = contentTextView.textStorage?.string.data(using: .utf8){
            do{
                let obj = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let dic = obj as? Dictionary<String, AnyObject>{
                    if dic.count > 0 {
                        let contentStr = NSMutableString()
                        for (key,value) in dic{
                            if let _ = value as? String{
                                contentStr.append("var \(key):String?\n")
                            }else if let _ = value as? Bool{
                                contentStr.append("var \(key):Bool?\n")
                            }else if let _ = value as? Int{
                                contentStr.append("var \(key):Int?\n")
                            }else if let _ = value as? Double{
                                contentStr.append("var \(key):Double?\n")
                            }else{
                                contentStr.append("var \(key):AnyObject?\n")
                            }
                        }
                        contentTextView.textStorage?.setAttributedString(NSAttributedString.init(string:contentStr as String))
                     }
                }
               
            }catch{
                
            }
        }else{
            contentTextView.textStorage?.setAttributedString(NSAttributedString.init(string: "格式不正确"))
        }
       
        
    }
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

