import Foundation

protocol Observer {
    func updateGUI(names: [String])
}

protocol Subject {
   mutating func attach(observer: Observer)
   mutating func detach(observer: Observer)
    func notifyObservers()
}

class GUI: Observer {
    func updateGUI(names: [String]) {
        display(names: names)
    }
    
    func display(names: [String])  {
        for name in names {
            print(name)
        }
    }
}

struct PersonNamesData: Subject {
    
    var personNames: [String]
    var observers: [Observer]
    
    mutating func attach(observer: Observer) {
        observers.append(observer)
    }
    
    mutating func detach(observer: Observer) {
        
     //   observer.delete(observer)
    }
    
    func notifyObservers() {
        for o in observers {
            o.updateGUI(names: personNames)
        }
    }
    
    mutating func addPersonName(name: String) {
        self.personNames.append(name)
    }
    
    mutating func removePersonName(name: String) {
        self.personNames.remove(at: personNames.index(of: name)!)
    }
}

let gui = GUI()
var data = PersonNamesData(personNames: [], observers: [])
data.attach(observer: gui)
data.attach(observer: gui)
data.addPersonName(name: "ddf")
data.addPersonName(name: "fa")


