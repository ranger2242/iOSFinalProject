//
//  ViewController.swift
//  FinalA
//
//  Created by Christopher Cavazos on 11/26/18.
//  Copyright © 2018 Christopher Cavazos. All rights reserved.
//

import UIKit
import iosMath

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var pickerList = ["Velocity", "Distance", "Time", "Acceleration", "Force", "Mass", "Momentum", "Weight", "Gravity", "Friction", "Radius", "Impulse", "Angle", "Energy","Work"]
    var tableList: [String] = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell
        
        cell.textLabel!.text = tableList[indexPath.row]
        
        return cell;
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerList[row]
    }
    
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addToList(_ sender: Any) {
        if(!tableList.contains(pickerList[picker.selectedRow(inComponent: 0)])){
            tableList.append(pickerList[picker.selectedRow(inComponent: 0)])
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            self.tableList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segue"{
            print("fs",self.formulaSet)

            print("t",tableList)
            var mapped = tableList.map {  $0.lowercased() }
            print("m",mapped)
            var chosenSet = Set(mapped)
            var matches = [String]()
            
            
            for x in self.formulaSet{
                print("x",x.set)
                var b = x.set.intersection(chosenSet)
                if(b == chosenSet){
                    matches.append(x.formula)
                }
            }
            print(matches)
            let vc = segue.destination as? SecondViewController
            vc?.formulaArray = matches
        }
    }
    
    var formulaSet = Set<Formula>()
    
    func loadFile(){
        let location = NSString(string:"/Users/tom-mac/Desktop/DATA.csv").expandingTildeInPath
        let fileContent = try? NSString(contentsOfFile: location, encoding: String.Encoding.utf8.rawValue) as String
        let lines = fileContent?.split(separator: "\r\n")
        
        for x in lines! {
            let tokens = x.split(separator: ",").map({String($0)})
            let f = String(tokens[0])
            let set = Array<String>( tokens[1..<tokens.count])
            let form = Formula(f, set)
            print(form)
            formulaSet.insert(form)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFile()
        tableView.dataSource = self
        tableView.delegate = self
        
        picker.dataSource = self
        picker.delegate = self
        
    }


}

