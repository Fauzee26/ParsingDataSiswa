//
//  CodeTableViewController.swift
//  ParsingDataSiswa
//
//  Created by Muhammad Hilmy Fauzi on 2/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class CodeTableViewController: UITableViewController {
    
    let studentURL = "https://raw.githubusercontent.com/mobilesiri/JSON-Parsing-in-Android/master/index.html"
    var student = [Students]()
    var idSelected:String?
    var nameSelected:String?
    var emailSelected:String?
    var addressSelected:String?
    var genderSelected:String?
    var mobileSelected:String?
    var homeSelected:String?
    var officeSelected:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStudentsData()
        
        //set row height to 92
        tableView.estimatedRowHeight = 92.0
        //set row table height to automatic dimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return student.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DisplayTableViewCell
        
        cell.labelID.text = "No\(student[indexPath.row].id)"
        cell.labelName.text = student[indexPath.row].name
        cell.labelEmail.text = student[indexPath.row].email
        cell.labelAddress.text = student[indexPath.row].address
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        let dataTask = student[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        idSelected = "\(dataTask.id)"
        nameSelected = dataTask.name
        emailSelected = dataTask.email
        addressSelected = dataTask.address
        genderSelected = dataTask.gender
        mobileSelected = "\(dataTask.mobile)"
        homeSelected = "\(dataTask.home)"
        officeSelected = "\(dataTask.office)"
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "segue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "segue"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! ViewController
            sendData.passID = idSelected
            sendData.passName = nameSelected
            sendData.passAdress = addressSelected
            sendData.passEmail = emailSelected
            sendData.passGender = genderSelected
            sendData.passHome = homeSelected
            sendData.passMobile = mobileSelected
            sendData.passOffice = officeSelected
        }
    }
    func getStudentsData() {
        guard let studentsURL = URL(string: studentURL) else {
            return //this return is for back up the value that got when call variable loanURL
        }
        let request = URLRequest(url: studentsURL)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                //condition when error
                //print error
                print(error)
                return //back up value error that we get
            }
            //parse JSON data
            //declare variable data to call data
            if let data = data {
                //for this part will call method parseJsonData that we will make in below
                self.student = self.parseJsonData(data: data)
                
                //reload tableView
                OperationQueue.main.addOperation({
                    //reload data again
                    self.tableView.reloadData()
                })
            }
        })
        //task will resume to call the json data
        task.resume()
    }
    func parseJsonData(data: Data) -> [Students] {
        var student = [Students]()
        do{
            //declare jsonResult for take data from the json
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            //parse json data
            //declare jsonLoans for call data array jsonResult with name Loans
            let jsonLoans = jsonResult?["studentsinfo"] as! [AnyObject]
            //will call data be repeated for jsonLoan have data json array from variable jsonLoans
            for jsonLoan in jsonLoans {
                //declare loan as object from class loan
                let studentss = Students()
                studentss.id = jsonLoan["id"] as! String
                studentss.name = jsonLoan["name"] as! String
                studentss.email = jsonLoan["email"] as! String
                studentss.address = jsonLoan["address"] as! String
                studentss.gender = jsonLoan["gender"] as! String
                let phone = jsonLoan["phone"] as! [String:AnyObject]
                studentss.mobile = phone["mobile"] as! String
                studentss.home = phone["home"] as! String
                studentss.office = phone["office"] as! String
                
                student.append(studentss)
            }
        }catch{
            print(error)
        }
        return student
    }
}




