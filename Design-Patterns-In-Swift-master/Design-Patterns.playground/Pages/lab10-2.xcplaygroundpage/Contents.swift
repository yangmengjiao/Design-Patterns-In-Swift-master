import Foundation

struct Flight {
    var numOfPassengers: Int
}

class Model {
    let BaseTicketPrice = 300
    let FixedCost = 50000
    
}

protocol IModel {
    func getRevenue(flights: [Flight]) -> Double
}

struct FlightsProfitCal {
    var strategy: Model
    func calFlightsProfit(flight: [Flight]) -> Double {
        return strategy.getRevenue(flight)
    }
}

class MultiClass: Model, IModel {
    var sum = 0.0
    func getRevenue(flights: [Flight]) -> Double {
        for flight in flights {
            sum += flight.numOfPassengers * 1/10 * 4 * BaseTicketPrice +
                flight.numOfPassengers * 1/5 * 1.5 * BaseTicketPrice +
                    flight.numOfPassengers * 7/10 * 0.75 * BaseTicketPrice -
                        1.2 * FixedCost;
        }
        return sum
    }
}

class TwoClasses: Model, IModel {
    var sum = 0.0
    func getRevenue(flights: [Flight]) -> Double {
        for flight in flights {
            sum += flight.numOfPassengers * 1/3 * 1.5 * BaseTicketPrice +
                flight.numOfPassengers * 2/3 * 0.75 * BaseTicketPrice -
                    1.1 * FixedCost;
        }
        return sum
    }
}

class SinglePrice: Model, IModel {
    var sum = 0.0
    func getRevenue(flights: [Flight]) -> Double {
        for flight in flights {
            sum += flight.numOfPassengers * BaseTicketPrice - FixedCost;
        }
        return sum
    }
}

let filghts = [Flight(numOfPassengers: 200),Flight(numOfPassengers: 180),Flight(numOfPassengers: 300)]
let cal = FlightsProfitCal(strategy: Model())
cal.strategy = MultiClass()
print(cal.calFlightsProfit(flight: filghts))
