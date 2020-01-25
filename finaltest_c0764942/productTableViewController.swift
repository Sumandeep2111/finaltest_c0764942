//
//  productTableViewController.swift
//  finaltest_c0764942
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class productTableViewController: UITableViewController {

    @IBOutlet var searchBar: UITableView!
    var products: [Product]?
    var filteredProducts: [Product]?

    weak var delegate: productViewController?
    var curIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        
        loadCoreData()
        filteredProducts = products
        searchBar.delegate = self
        saveCoreData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filteredProducts?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let product = filteredProducts![indexPath.row]
               let cell = tableView.dequeueReusableCell(withIdentifier: "productCell")
               cell?.textLabel?.text = product.productName

               return cell!
    }
    
    @objc func saveCoreData(){
          
                 clearCoreData()
          
                 let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    
                  let context = appDelegate.persistentContainer.viewContext
                        
                        //3rd step: write into the context
                        
                        
                  let product1 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                        
                  product1.setValue("Television", forKey: "name")
                  product1.setValue("1", forKey: "id")
                  product1.setValue("This is Tv", forKey: "descriptions")
                  product1.setValue(200, forKey: "price")
                 
                 
                  let product2 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                 
                  product2.setValue("Washing Machine", forKey: "name")
                  product2.setValue("2", forKey: "id")
                  product2.setValue("This is Washing Machine", forKey: "descriptions")
                         product2.setValue(210, forKey: "price")
          
                  let product3 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                 
                  product3.setValue("Mixer", forKey: "name")
                  product3.setValue("3", forKey: "id")
                  product3.setValue("This is mixer", forKey: "descriptions")
                  product3.setValue(100, forKey: "price")
                          
                          
                  let product4 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                          
                  product4.setValue("Vaccuum Cleaner", forKey: "name")
                  product4.setValue("4", forKey: "id")
                  product4.setValue("This is Vaccuum Cleaner", forKey: "descriptions")
                  product4.setValue(100, forKey: "price")
          
                  let product5 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                        
                  product5.setValue("Radio", forKey: "name")
                  product5.setValue("5", forKey: "id")
                  product5.setValue("This is Radio", forKey: "descriptions")
                  product5.setValue(150, forKey: "price")
                                 
                                 
                  let product6 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                 
                  product6.setValue("Computer", forKey: "name")
                  product6.setValue("6", forKey: "id")
                  product6.setValue("This is Computer", forKey: "descriptions")
                  product6.setValue(2000, forKey: "price")
          
                  let product7 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                        
                  product7.setValue("Mouse", forKey: "name")
                  product7.setValue("7", forKey: "id")
                  product7.setValue("This is Mouse", forKey: "descriptions")
                  product7.setValue(80, forKey: "price")
                                 
                                 
                  let product8 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                                 
                  product8.setValue("Keyboard", forKey: "name")
                  product8.setValue("8", forKey: "id")
                  product8.setValue("This is Keyboard", forKey: "descriptions")
                  product8.setValue(70, forKey: "price")
          
                  let product9 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
                 
                 product9.setValue("Ipad", forKey: "name")
                 product9.setValue("9", forKey: "id")
                 product9.setValue("This is Ipad", forKey: "descriptions")
                 product9.setValue(1500, forKey: "price")
          
          
                  let product10 = NSEntityDescription.insertNewObject(forEntityName: "ProductModel", into: context)
          
                  product10.setValue("Mobile", forKey: "name")
                  product10.setValue("10", forKey: "id")
                  product10.setValue("This is Mobile", forKey: "descriptions")
                  product10.setValue(1800, forKey: "price")
                        
                        // 4th step: save context
                        
                        do{
                            try context.save()
                            print(product1, "is saved")
                            print(product2, "is saved")
                        }
                        catch{
                            print(error)
                        }
      }
      
      func loadCoreData(){
          
          products = [Product]()
          
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
                      products?.append(Product(productName: productName, productId: productId, productDescription: productDescription, price: productPrice))
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
          
          let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductModel")
          
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
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let detailView = segue.destination as? productViewController{
            detailView.taskTable = self
            //detailView.tasks = tasks
            
            if let tableViewCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableViewCell)?.row{
                  detailView.textString1 = products![index].productName
                  detailView.textString2 = products![index].productId
                  detailView.textString3 = products![index].productDescription
                  detailView.textString4 = String(products![index].price)
                    
                    curIndex = index
                }
            }
            
       }
    
    }

}

extension productTableViewController: UISearchBarDelegate{

func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
    filteredProducts = searchText.isEmpty ? products : products?.filter({ (item: Product) -> Bool in
        return item.productName.range(of: searchText, options: .caseInsensitive) != nil
    })
    
    tableView.reloadData()
  }
}
