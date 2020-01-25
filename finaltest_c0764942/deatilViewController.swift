//
//  deatilViewController.swift
//  finaltest_c0764942
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class deatilViewController: UIViewController {

    
    @IBOutlet weak var nameLbl: UITextField!
    
    @IBOutlet weak var idLbl: UITextField!
    
    @IBOutlet weak var priceLbl: UITextField!
    
    @IBOutlet weak var DescriptionLbl: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @objc func saveCoreData(){

                 clearCoreData()

                 let appDelegate = UIApplication.shared.delegate as! AppDelegate

                  let context = appDelegate.persistentContainer.viewContext

                        //3rd step: write into the context


                  let product1 = NSEntityDescription.insertNewObject(forEntityName: "ProductMod", into: context)

                  product1.setValue("Heater", forKey: "product_name")
                  product1.setValue("ab0", forKey: "product_id")
                  product1.setValue("This is Heater", forKey: "product_descriptions")
                  product1.setValue(140, forKey: "product_price")


                        // 4th step: save context

                        do{
                            try context.save()
                            print(product1, "is saved")
                        }
                        catch{
                            print(error)
                        }
      }



      func loadCoreData(){



          //create an instance of app delegate
          let appDelegate = UIApplication.shared.delegate as! AppDelegate

          /*
              Second we need the context
              This context is the manager like location manager, audio manager etc
           */

          let managedContext = appDelegate.persistentContainer.viewContext

          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductMod")

          do{
              let results = try managedContext.fetch(fetchRequest)
              if results is [NSManagedObject]{
                  for result in results as! [NSManagedObject]{
                      let productName = result.value(forKey: "product_name") as! String
                      let productId = result.value(forKey: "product_id") as! String
                      let productDescription = result.value(forKey: "product_descriptions") as! String
                      let productPrice = result.value(forKey: "product_price") as! Int
                      nameLbl.text = productName
                      idLbl.text = productId
                      priceLbl.text = String(productPrice)
                      DescriptionLbl.text = productDescription
                  }
              }
          }
          catch{
              print(error)
          }


      }

      func clearCoreData(){

          //create an instance of app delegate
          let appDelegate = UIApplication.shared.delegate as! AppDelegate

          /*
              Second we need the context
              This context is the manager like location manager, audio manager etc
           */

          let managedContext = appDelegate.persistentContainer.viewContext

          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductMod")

          fetchRequest.returnsObjectsAsFaults = false

          do{
              let results = try managedContext.fetch(fetchRequest)
              for managedObjects in results{
                  if let managedObjectData = managedObjects as? NSManagedObject{
                      managedContext.delete(managedObjectData)
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
