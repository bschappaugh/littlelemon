import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "ExampleDatabase")
        container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        container.loadPersistentStores(completionHandler: {_,_ in })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func clear() {
        // Delete all dishes from the store
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Dish")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        let _ = try? container.persistentStoreCoordinator.execute(deleteRequest, with: container.viewContext)
        // Commented out the last line above in favor of the logic below. The provided code did not clear Core Data
        deleteRequest.resultType = .resultTypeObjectIDs
        let context = container.viewContext
        let batchDelete = try? context.execute(deleteRequest) as? NSBatchDeleteResult
        guard let deleteResult = batchDelete?.result as? [NSManagedObjectID] else { return }
        let deletedObjects: [AnyHashable: Any] = [
            NSDeletedObjectsKey: deleteResult
        ]
        NSManagedObjectContext.mergeChanges(
            fromRemoteContextSave: deletedObjects,
            into: [context]
        )
    }
}
