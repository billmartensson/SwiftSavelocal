//
//  ViewController.swift
//  SaveLocal
//
//  Created by Bill Martensson on 2020-10-08.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var theTextfield: UITextField!
    
    
    @IBOutlet weak var theTableview: UITableView!
    
    var favorites = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        
        /*
        if let theSavedText = defaults.string(forKey: "thetext") {
            theTextfield.text = theSavedText
        }
        */
        
        if let theSavedFav = defaults.array(forKey: "fav") {
            favorites = theSavedFav as! [String]
        }
        
    }
    
    
    @IBAction func letsSave(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        //defaults.set(theTextfield.text, forKey: "thetext")
        
        favorites.append(theTextfield.text!)
        
        defaults.set(favorites, forKey: "fav")
        
        theTableview.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = favorites[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        favorites.remove(at: indexPath.row)
        
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: "fav")
        
        theTableview.reloadData()
    }
}


