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
    @State var startersFilter = false
    @State var mainsFilter = false
    @State var dessertsFilter = false
    @State var sidesFilter = false
    
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
                    oneDish.desc = menuItem.desc
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
#warning ("TODO Make the category filter button work")
//        if dessertsFilter {
//            return NSPredicate(format: "category == %@", "desserts")
//        }
        return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            VStack(){
                Hero()
                   
                TextField("Search menu", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.all, 20)
            }
            .background(Color("Dark Green"))
            
            // Menu Breakdown
            Text("ORDER FOR DELIVERY!")
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
            ScrollView(.horizontal) {
                HStack{
                    Spacer()
                    Toggle(isOn: $startersFilter) {
                        Text("Starters")
                            .foregroundColor(Color("Secondary 4"))
                            .padding(6)
                    }
                    .background(Color("Secondary 3"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .toggleStyle(.button)
                    .tint(.black)
                    
                    Spacer()
                    
                    Toggle(isOn: $mainsFilter) {
                        Text("Mains")
                            .foregroundColor(Color("Secondary 4"))
                            .padding(6)
                    }
                    .background(Color("Secondary 3"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .toggleStyle(.button)
                    .tint(.black)
                    
                    Spacer()
                    
                    Toggle(isOn: $dessertsFilter) {
                        Text("Desserts")
                            .foregroundColor(Color("Secondary 4"))
                            .padding(6)
                    }
                    .background(Color("Secondary 3"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .toggleStyle(.button)
                    .tint(.black)
                    
                    Spacer()
                    
                    Toggle(isOn: $sidesFilter) {
                        Text("Sides")
                            .foregroundColor(Color("Secondary 4"))
                            .padding(6)
                    }
                    .background(Color("Secondary 3"))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .toggleStyle(.button)
                    .tint(.black)
                    
                    Spacer()
                }
            }
            
            // Menu Item List
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
            List {
                ForEach(dishes) { dish in
                    HStack{
                        // Dish info
                        VStack(alignment: .leading){
                            Text(dish.title!)
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                            Text(dish.desc!)
                                .lineLimit(2)
                                .padding(.vertical, 0.5)
                            Text("$\(dish.price!)")
                                
                        }
                        
                        Spacer()
                        // Dish image
                        AsyncImage(url: URL(string: dish.image!)) { image in
                            image.image?.resizable()
                        }
                        .frame(width: 80, height: 80)
                    } //:HStack
                    .frame(maxWidth: .infinity)
                }
            } //:List
        } //:FetchedObjects
        } //:VStack
        .onAppear(perform: { getMenuData() })
    }
}

#Preview {
    Menu()
}
