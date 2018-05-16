

//implement by swift
import Foundation

protocol CarState {
    func left() -> Int
    func accel() -> Int
    func right() -> Int
    func brake() -> Int
    func nextState()
}

struct Simulator {
    var regularState: RegularState
    var gravelState: GravelState
    var wetState : WetState
    var iceState: IceState
    var state: CarState
}

class GravelState: CarState {
    var sim: Simulator
    
    init(simu: Simulator) {
        self.sim = simu
    }
    func left() -> Int {
        return 3
    }
    
    func accel() -> Int {
        return 7
    }
    
    func right() -> Int {
        return 3
    }
    
    func brake() -> Int {
        return 6
    }
    
    func nextState() {
        self.sim.state = self.sim.wetState
    }
}

class IceState: CarState {
    var sim: Simulator
    
    init(simu: Simulator) {
        self.sim = simu
    }
    func left() -> Int {
        return 1
    }
    
    func accel() -> Int {
        return 3
    }
    
    func right() -> Int {
        return 1
    }
    
    func brake() -> Int {
        return 2
    }
    
    func nextState() {
        self.sim.state = self.sim.regularState
    }
}

class RegularState: CarState {
    var sim: Simulator
    
    init(simu: Simulator) {
        self.sim = simu
    }
    func left() -> Int {
        return 5
    }
    
    func accel() -> Int {
        return 9
    }
    
    func right() -> Int {
        return 5
    }
    
    func brake() -> Int {
        return 8
    }
    
    func nextState() {
        self.sim.state = self.sim.gravelState
    }
}


class WetState: CarState {
    var sim: Simulator
    
    init(simu: Simulator) {
        self.sim = simu
    }
    func left() -> Int {
        return 4
    }
    
    func accel() -> Int {
        return 9
    }
    
    func right() -> Int {
        return 4
    }
    
    func brake() -> Int {
        return 7
    }
    
    func nextState() {
        self.sim.state = self.sim.iceState
    }
}



