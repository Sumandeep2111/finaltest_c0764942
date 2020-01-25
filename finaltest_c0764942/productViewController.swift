//
//  productViewController.swift
//  finaltest_c0764942
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData
class productViewController: UIViewController {

    @IBOutlet weak var productName: UITextField!
       
       @IBOutlet weak var productId: UITextField!
       
       @IBOutlet weak var productPrice: UITextField!
       
       @IBOutlet weak var productDescription: UITextField!
       
       var textString1: String?
       var textString2: String?
       var textString3: String?
       var textString4: String?
       
       weak var taskTable: productTableViewController?
       
    override func viewDidLoad() {
        super.viewDidLoad()

        productName.text = textString1
        productId.text = textString2
        productDescription.text = textString3
        productPrice.text = textString4
        // Do any additional setup after loading the view.
    }
    

    func loadCoreData(){
           
           //products = [Product]()
           
           //create an instance of app delegate
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
               
           /*
               Second we need the context
               This context is the manager like location manager, audio manager etc
            */
                   
           let managedContext = appDelegate.persistentContainer.viewContext
           
           let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModel")
           
           do{
               let results = try managedContext.fetch(fetchRequest)
               if results is [NSManagedObject]{
                   for result in results as! [NSManagedObject]{
                       let productName = result.value(forKey: "name") as! String
                       let productId = result.value(forKey: "id") as! String
                       let productDescription = result.value(forKey: "descriptions") as! String
                       let productPrice = result.value(forKey: "price") as! Int
                       
                   }
               }
           }
           catch{
               print(error)
           }
           
           
       }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
