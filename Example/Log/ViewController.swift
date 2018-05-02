//
//  ViewController.swift
//  Log
//
//  Created by theapache64 on 05/02/2018.
//  Copyright (c) 2018 theapache64. All rights reserved.
//

import UIKit
import Log

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        Log.d("This is a debug log")
        Log.e("This is a error log")
        Log.w("This is a warning log")
        Log.f("This is a fatal log")
        Log.i("This is a information log")
        Log.v("This is a verbose log")
        Log.with(key: "Username", value: "theapache64")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

