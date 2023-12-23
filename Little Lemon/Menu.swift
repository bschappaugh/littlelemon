//
//  Menu.swift
//  Little Lemon
//
//  Created by Brandon Schappaugh on 12/20/23.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText = ""
    
    func getMenuData() {
        PersistenceController.shared.clear()
       
        let urlString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        let downloadTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data)
                let menuItems = fullMenu!.menu
                for menuItem in menuItems {
                    let oneDish = Dish(context: viewContext)
                    oneDish.title = menuItem.title
                    oneDish.price = menuItem.price
                    oneDish.image = menuItem.image
                }
                try? viewContext.save()
            }
        }
        downloadTask.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)),
        ]
    }
    
    func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    var body: some View {
        VStack{
            Text("Little Lemon")
            Text("Chicago")
            Text("Short Description")
            
            TextField("Search menu", text: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
            List {
                ForEach(dishes) { dish in
                    HStack{
                        Text("\(dish.title!) $\(dish.price!)")
                        AsyncImage(url: URL(string: dish.image!)) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 50, height: 50)
                    }
                }
            }
        }
        }
        .onAppear(perform: { getMenuData() })
    }
}

#Preview {
    Menu()
}
