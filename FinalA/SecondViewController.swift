//
//  SecondViewController.swift
//  Final
//
//  Created by Emily Saenz on 11/28/18.
//  Copyright © 2018 Emily Saenz. All rights reserved.
//

import UIKit

import iosMath

class CustomCell : UITableViewCell{
    @IBOutlet weak var mathView: MTMathUILabel!
    
}


class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var formulaSet = Set<String>()
    var formulaArray = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formulaArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "equationCell")! as! CustomCell
        
        
        let label = cell.mathView!
        label.latex = formulaArray[indexPath.row]
        //tableView.reloadData()
            
        return cell
   }
    
    
    var searchVars: Set<String> = Set<String>()
    var searchArray: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(formulaArray)
        equationView.delegate = self
        equationView.dataSource = self
        
        formulaSet = Set(formulaArray)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var equationView: UITableView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
