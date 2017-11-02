//
//  ViewController.swift
//  ParsingDataSiswa
//
//  Created by Muhammad Hilmy Fauzi on 2/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblOffice: UILabel!
    var passID:String?
    var passName:String?
    var passEmail:String?
    var passAdress:String?
    var passGender:String?
    var passMobile:String?
    var passHome:String?
    var passOffice:String?
    
    override func viewDidLoad() {
        
        lblName.text = passName!
        lblID.text = passID!
        lblEmail.text = passEmail!
        lblAddress.text = passAdress!
        lblGender.text = passGender!
        lblMobile.text = passMobile!
        lblHome.text = passHome!
        lblOffice.text = passOffice!
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

