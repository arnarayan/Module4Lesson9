//
//  ContentView.swift
//  Module4Lesson9
//
//  Created by Anand Narayan on 2022-03-11.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedMenu = "Salad"
    @State var selectedLocation = "Edmonton"
    @State var pickupTime = 1
    var cities = [
        "Edmonton",
        "Saskatoon",
        "Winnipeg",
        "Vancouver",
        "St. Johns",
        "Calgary",
        "Toronto",
        "Kelowna",
    ]
    var menu = [
        "Salad",
        "Grilled Salmon",
        "Lasagna",
        "Hamburger",
        "French Fries",
        "Pizza",
        "Sliders",
        "Wraps",
        "Sandwhich",
    ]
    var pickup = [
        1, 3, 6, 8
    ]
    var body: some View {
        VStack {
            Text("Ottimo Ristorante").font(.headline)
            Spacer()
            HStack {
                Text("Location:")
                Picker("Locations", selection:$selectedLocation) {
                    ForEach(cities, id:(\.self)) {  cityName in
                        Text(cityName)
                    }
                }.pickerStyle(.menu)
            }
            Spacer()
            VStack {
                Text("Menu: ")
                Picker("Order", selection: $selectedMenu) {
                    ForEach(menu, id:(\.self)) {  item in
                        Text(item)
                    }
                }.padding(.bottom, 3.0)
                .pickerStyle(.wheel)
            }
            Spacer()
            VStack {
                Text("Pick up Time")
                Picker("Pickup Time", selection: $pickupTime){
                    ForEach(pickup, id:(\.self)) {  time in
                        Text(String(time) + "pm")
                    }
                }.pickerStyle(.segmented)
                
            }
            Spacer()
            Button("Pick for me!", action: {
                self.selectedMenu = menu[Int.random(in: 0...8)]
                self.pickupTime = pickup[Int.random(in: 0...3)]
                self.selectedLocation = cities[Int.random(in: 0...7)]
            })
        }

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
